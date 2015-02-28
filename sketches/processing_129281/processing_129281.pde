
int addOdd(int n){
    ans = 0;
    for(int i=1; i <= n; i+=2){        ans = ans + i;
    }
    return ans;
}

b=addOdd(7);
println(b);

