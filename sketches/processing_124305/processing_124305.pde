
float addOdd(n){
    a=0;
    for(int i=1; i<=n; i+=2){
        a += i;
    }
    return a;
}

for(int n=5; n<=10; n++){
    println(addOdd(n));
    }
