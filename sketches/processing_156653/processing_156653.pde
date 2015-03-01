
int gcf(int a, int b) {
return a != b ? ( a > b ? gcf(a-b, b) : gcf(b-a, a)) : a; 
}


