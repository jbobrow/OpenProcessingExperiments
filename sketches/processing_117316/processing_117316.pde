
float keisan(x){
     b=pow(x,2)+2*x+sin(x)+1;
     return b;
}
println('****************');
for(i=0;i<=10;i++){
    c=keisan(i);
    println(i+' : '+c);
}


****************
0 : 1
1 : 4.841470984807897
2 : 9.909297426825681
3 : 16.141120008059865
4 : 24.243197504692073
5 : 35.04107572533686
6 : 48.72058450180107
7 : 64.65698659871879
8 : 81.98935824662338
9 : 100.41211848524176
10 : 120.45597888911063
