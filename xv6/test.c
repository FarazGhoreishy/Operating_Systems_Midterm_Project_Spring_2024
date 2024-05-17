#include "types.h"
#include "stat.h"
#include "user.h"

#define ARRAY_SIZE 100 
#define SEGMENT_COUNT 5

int find_max_array(int *array, int start, int end) 
{
    int max_value = - __INT_MAX__ - 1;

    for (int i = start + 1; i < end; i++) 
        if (array[i] > max_value) 
            max_value = array[i];
    return max_value;
}

int j = 0;

int main() 
{

    int array[ARRAY_SIZE];
    int segment_max[SEGMENT_COUNT]; 


    for (int i = 0; i < ARRAY_SIZE; i++)
        array[i] = ARRAY_SIZE - 1;

    int segment_size = ARRAY_SIZE / SEGMENT_COUNT; 

    for (int i = 0; i < SEGMENT_COUNT; i++) 
    {
        int pid = fork();
        if (pid  == 0) 
        { 
            int segment_max_value = find_max_array(array,  j * segment_size, (j + 1) * segment_size);
            segment_max[i] = segment_max_value;
            j ++;
            faps(getpid());
            exit(); 
        }
        if (pid > 0)
        {   
            int wpid;
            while ((wpid = wait()) > 0);
        }
    }
    printf(1, "\n");
        
    for (int i = 0; i < SEGMENT_COUNT - 1; i++) 
        for (int j = 0; j < SEGMENT_COUNT - i - 1; j++)
            if (segment_max[j] < segment_max[j + 1]) 
            {
                int tmp = segment_max[j];
                segment_max[j] = segment_max[j + 1];
                segment_max[j + 1] = tmp;
            }
            


    // for(int i = 0; i < SEGMENT_COUNT; i++)
    //     printf(1, "%d\t", segment_max[i]);
    
    printf(1, "Sorting Finished.\n");
    faps(getpid());
    exit();
}