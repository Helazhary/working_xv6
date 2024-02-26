#include "types.h"
#include "user.h"


void swap(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void bubbleSort(int arr[], int n) {
    int i, j;
    for (i = 0; i < n - 1; i++)        
        for (j = 0; j < n - i - 1; j++)  
            if (arr[j] > arr[j + 1])
                swap(&arr[j], &arr[j + 1]);
}


void printArray(int arr[], int size) {
    int i;
    for (i = 0; i < size; i++)
        printf(1, "%d ", arr[i]);
    printf(1, "\n"); 
}


int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf(1,"Error: No Args Provided");
        exit(); 
    }

    int n = argc - 1;
    int arr[n];
    
    for (int i = 0; i < n; i++) {
        arr[i] = atoi(argv[i + 1]);
    }

    bubbleSort(arr, n);
    printf(1,"Sorted array: \n");
    printArray(arr, n);
    exit();
}
