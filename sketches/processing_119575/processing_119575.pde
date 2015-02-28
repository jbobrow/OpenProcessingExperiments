
int mult(n){
    
    ans = 1;
        
        for(int i=2; i <= n; i++){
            ans = ans * i;
    }
                                 
    return ans;

}
           
for(int i=1; i < 11; i++){
    a=mult(i);
    println(a);
}
