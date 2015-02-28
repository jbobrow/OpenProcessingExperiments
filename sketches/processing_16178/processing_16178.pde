
int nombreligne;
void setup() {
  size(600,600);
    background(0);
    }
   
    //1//
void draw() {
    nombreligne=0;
    while(nombreligne<600){
      nombreligne=nombreligne+5;
      stroke(55);
      stroke(random(255),random(255),random(255),random(255));
      line(600,random(600),300,300);
      line(0,random(600),300,300);
      line(300,300,random(600),0);
      line(300,300,random(600),600);
    }
  }
  
  //2//

      


