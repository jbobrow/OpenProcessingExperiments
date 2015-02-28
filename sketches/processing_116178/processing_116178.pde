
int add(int n){
    ans = 0;
    for(int i=1; i <= n; i++){
        ans = ans + i;
        printin(ans);
    }
    return ans;
}

b=add(5)
printin(b);
