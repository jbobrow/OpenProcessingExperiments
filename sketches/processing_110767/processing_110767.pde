
void setup(){
size(550,550);
background(56,163,34);//set the size and the color
stroke(0);
strokeWeight(30.0);
rectMode(CENTER);
ellipseMode(CENTER);

//set the attribute of the necessary

  }
  
  void draw(){
    color c1 = color(56,163,34);
    color c2 = color(163,74,0);
    for(int i=100;i<500;i=i+70){
    for(int j=100;j<500;j=j+70){
      rect(i,j,j,i);//acutally, I am only drawing some radom shapes with the number came to my mind,and after I tried it, I fount it does not looked bad,and this is it
    if(i>270&j>200){
ellipse(i,j,j,i);fill(c1);}
      else{fill(c2);//use the varies color
  }
  }
    }
  }
