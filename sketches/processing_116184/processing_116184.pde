
int add(int n){
        ans = 0;
        for(int i=1; i < n; i=i+2){
        ans = ans + i;
        println(ans);
        }
        return ans;
}
println(add(10));
