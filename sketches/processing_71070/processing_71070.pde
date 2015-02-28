
PFont font1, font2;

void setup(){
  
  size(400, 400);
  frameRate(4); 
  font1 = createFont("FFScala", 10);
  font2 = createFont("Segoe Script", 10);
  
  
}

int i=65;
int p=0;
int j=97;
void draw(){

 fill(130,0,0);
  
 if (i<=90){
   textFont(font1);
   text(char(i),p, 10); 
 }
 
 if(j<=122){ 
  textFont(font2);
  text(char(j),p, 20);
 }
 
 i++;
 j++;
 p += 10;

}
