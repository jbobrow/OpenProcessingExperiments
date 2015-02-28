
float keisan(a){
    b=pow(a,2)+2*a+sin(a)+1;
    return b;
} 

c=keisan(5);
println(c);

c=keisan(-3);
println(c);

//x2+2x+sin(x)+1 を計算するプログラムをkeisanという関数として作成し，println関数を使ってx=5の場合およびx=-3の場合について結果を表示せよ。
