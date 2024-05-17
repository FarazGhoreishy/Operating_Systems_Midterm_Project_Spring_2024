#include "types.h"
#include "stat.h"
#include "user.h"

struct Process_Info
{
  int parent_pid;             // Parent process ID
  int pid;                    // Process ID
  int state;                  // Process state
  char name[16];              // Process name
};

int main() 
{

    struct Process_Info* process_info = (struct Process_Info*) malloc(sizeof(*process_info));   

    ps(5, 4, process_info);

    printf(1, "Process found with following details:\n\r");
    printf(1. "Name\t%d\n", process_info[0].pid);
    // printf(1. "Name\t%s\n", process_info->name);
    // printf(1. "Name\t%s\n", process_info->name);

    free(process_info);  
    faps(getpid());
    exit();
}