
int x= 15;
int y= 300;
size(500,500);

int[] danCool= {50,20,34,53,19,32,65,13,35,32};

for(int i=0; i< danCool. length; i++){
  fill(random(255), random(255), random(255));
 x+=45;
  rect(x,y,45,-danCool[i]);
}
