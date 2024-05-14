#include "types.h"
#include "stat.h"
#include "user.h"

// void
// printf(int fd, const char *s, ...)
// {
//   write(fd, s, strlen(s));
// }

int find_max(int *array, int start, int end) {
    int max = array[start];
    for (int i = start + 1; i < end; i++) {
        if (array[i] > max) {
            max = array[i];
        }
    }
    return max;
}


void bubbleSort(int arr[], int size) {
    for (int i = 0; i < size - 1; i++) {
        for (int j = 0; j < size - i - 1; j++) {
            if (arr[j] < arr[j + 1]) {
                // Swap arr[j] and arr[j + 1]
                int tmp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = tmp;
            }
        }
    }
}

int j = 0;


int main() {
    int n = 20; 
    int m = 4;  
    int array[n];
    int temp[m]; 


    for (int i = 0; i < n; i++) {
        array[i] = n - i;
    }

    int segment_size = n / m; 
    printf(1, "Segment maximum:\n");
    for (int i = 0; i < m; i++) {
        int pid = fork();
        if (pid  == 0) { 
        int segment_max = find_max(array,  j * segment_size, (j + 1) * segment_size);
        printf(1, "%d  ", segment_max);
        temp[i] = segment_max;
        j ++;
        exit(); 
        }
    }
    
    bubbleSort(temp,sizeof(temp) / sizeof(temp[0]));
    
    printf(1, "\n");

    printf(1, "Sorted maximums:\n");
    for(int i = 0; i<m;i++){
        printf(1, "%d  ",temp[i]);
    }
    
    printf(1, "\n");
    faps();
    exit();
}