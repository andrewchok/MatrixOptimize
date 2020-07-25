#include "pch.h"
#include "StopWatch.h"

using namespace std;

constexpr int32_t matrixMemorySize = 8192 * 1024;
int32_t* matrix = static_cast<int32_t*>(malloc(matrixMemorySize * sizeof(int32_t)));

__declspec(noinline) void RowMajor(int width, int height)
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            matrix[(i * width) + j]++;
        }
    }
}

__declspec(noinline) void ColMajor(int width, int height)
{
    for (int j = 0; j < width; j++)
    {
        for (int i = 0; i < height; i++)
        {
            matrix[(i * width) + j]++;
        }
    }
}

void ResetMatrix()
{
    for (int i = 0; i < matrixMemorySize; i++)
    {
        matrix[i] = 0;        
    }
}

int main(int argc, char* argv[])
{
    // Quit if correct number of args not passed
    if (argc != 2)
    {
        cout << "Not Correct Args";
        return 0;
    }

    int32_t matrixWidth = atoi(argv[1]);
    int32_t matrixHeight = (matrixMemorySize / matrixWidth);

    Library::StopWatch stopWatch;
    
    string fileName = "Width_"s + std::to_string(matrixWidth) + ".txt"s;
    ofstream myfile(fileName);
    if (myfile.is_open())
    {
        myfile << "Row Time"s << ", ";
        myfile << "Column Time"s << "\n";
        for (int iterations = 0; iterations < 100; iterations++)
        {
            ResetMatrix();

            stopWatch.Restart();
            RowMajor(matrixWidth, matrixHeight);
            stopWatch.Stop();

            myfile << stopWatch.ElapsedMilliseconds().count() << ", ";

            ResetMatrix();

            stopWatch.Restart();
            ColMajor(matrixWidth, matrixHeight);
            stopWatch.Stop();

            myfile << stopWatch.ElapsedMilliseconds().count() << "\n";
        }
        myfile.close();
    }
    else cout << "Unable to open file";
    

    return 0;
}
