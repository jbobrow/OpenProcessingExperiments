
froat keisan(a){
b=pow(a,3)+2*a+sin(a)+1;
return b;

}

c=keisan(3);
println(c);

println('**************************');
for(i=0;i<=10;i++){
    c=keisan(i);
    println(i+':'+c);
}
