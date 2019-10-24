
volatile unsigned int * const UART0DR = (unsigned int *)0x101f1000;
 
void print_uart0(const char *s) {
 while(*s != '\0') { /* Loop until end of string */
 *UART0DR = (unsigned int)(*s); /* Transmit char */
 s++; /* Next char */
 }
}

void handler_timer(void) {
    unsigned int *timer_reset = (unsigned int *) 0x101E900c;
    *timer_reset = 0;
    print_uart0("#");
    return;
}

void timer_monitor(void) {
    unsigned int *timer_reset = (unsigned int *) 0x101E900c;
    *timer_reset = 0;
    print_uart0("7");
    return;
}



void c_entry() {
    print_uart0("Hello world!\n");
}

void print_space() {
    int i = 0;
    int j = 0;
    int k = 0;
    int l;
    for(i=0; i< 1000000; i++)
                l = k;
    print_uart0(" ");
}
