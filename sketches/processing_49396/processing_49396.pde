
int[] colors = {
  #000000, #964B00, #FF0000, #FFA500, #FFFF00,
  #9ACD32, #6495ED, #EE82EE, #A0A0A0, #FFFFFF
};
float Phi = (1+sqrt(5))/2;
int X = 80;
float Y = X * Phi;
float ratio = X/TWO_PI;
size (int(X*10 + ratio), int(Y + ratio));
strokeWeight(ratio);
for(int i = 0; i <10; i++){
  fill(colors[i]);
  rect((i*X)+(ratio/2), ratio/2, X, Y);
}                               
