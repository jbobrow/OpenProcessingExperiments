
String lines[];
int count = 0;

void setup () {
  size(1300,700);
  lines = loadStrings("speech.txt");
  textAlign(CENTER);
  frameRate(10);
}

void draw () {
  if(count >= lines.length){
     return; 
  }
  
  background(0);
  
  int i=0;
  int x=0;
  int y=80;
  
  for(i=0;i<(lines.length);i=i+1){
    if((x*18+15)>height){
      x=0;
      y=y+143;
    }
    if(cnt==i){
      fill(237,255,3);
    }
    else{
      fill(255);
    }
    
       
    textSize(7);
    text(lines[i],y,x*15+15);
    x=x+1; 
  
   
  textSize(45);
  text(lines[cnt],width/2,height-40);
  }
  
  
  count++;
}
int cnt=0;
void keyPressed(){
  if (key==CODED){
    if(keyCode==DOWN){
      cnt=cnt+1;
    }
    else if(keyCode==UP){
      cnt=cnt-1;
    }
  }
}

    


