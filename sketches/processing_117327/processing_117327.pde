
float keisan(a){
    b=pow(a,2)+2*a+sin(a)+1;
    return b;
}

println('********************');
for(i=0;i<=10;i++){
    c=keisan(i);
    println(i+' : '+c);
}
