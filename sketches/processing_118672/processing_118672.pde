
float power(x,n){
    ans=1;
    for(i=0;i<n;i++){
        ans*=x;
    }
    return ans;
}

///8,2は8の二乗ということ
println(power(8,2));
///float power(x(8),y(二乗)
