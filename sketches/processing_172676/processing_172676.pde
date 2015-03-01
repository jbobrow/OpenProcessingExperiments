
int shiro1=-5;
int shiro2=-5;
int shiro3=450;
int shiro4=-5;

void setup(){
  size(500,500);
}
void draw (){
  rectMode (CORNER);
  rect(shiro1,shiro2,50,50);
  fill(#D10D83);
rect(shiro3,shiro4,50,50);

shiro1=shiro1 +2;
shiro2=shiro2 +2;
shiro3=shiro3 -2;
shiro4=shiro4 +2;
}
