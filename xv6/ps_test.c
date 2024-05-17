#include "types.h"
#include "stat.h"
#include "user.h"

struct Process_Info
{
  char parent_name[16];             // Parent process ID
  int pid;                          // Process ID
  int state;                        // Process state
  char name[16];                    // Process name
};

int main() 
{
    struct Process_Info* process_info = (struct Process_Info*) malloc(sizeof(struct Process_Info));   

    ps(6, 4, process_info);
    
    printf(1, "Process found with the following details:\n\r");
    printf(1, "Name\t%s\n", process_info->name);
    printf(1, "PID\t%d\n", process_info->pid);
    printf(1, "State\t%d\n", process_info->state);
    printf(1, "Parent Name\t%s\n", process_info->parent_name);
    
    free(process_info);  
    faps(getpid());
    exit();
}