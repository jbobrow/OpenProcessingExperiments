
int addOdd(int n) {
    ans = 0;
    for(int i=1; i <= n; i++) {
         if(i%2!=0)ã��ans = ans + i;
        println(ans);
    }
    return ans;
}

b=addOdd(10);
println(b);
