
class Aside{
String[] story={
  "It's something about memory",
  "Once again, Jack comes back to the island.",
  "The river flows as usual.While the heat is getting killing.",
  "Jack is getting lost. Only the bridge tell the right way.",
  "Of course the bell. She used to said it's a bit annoying to know the exact time whenever.",
  "Actually the bell tower is much further than thought.",
  "The cafe on the corner was her favorite. ",
  "They've been there a thousand of times.It's her favorite.",
  "Still a warm place. Nothing changed except her.",
  "More and more people come to the cafe.Seems no one get bothered by the rain.",
  "How does Jack wishes her come as usual, even in the dream."
   };
   
int i,x,y;

  Aside(int c,int xp,int yp){
   i=c;
   x=xp;
   y=yp;
   
  }
  
  void display(){
   if(i<14){
  textSize(21);
  textAlign(CENTER);
  fill(255,239,00);
  text(story[i],x,y);}
  else println("out of text");
    }
  
  void update(){
  text("",x,y);
  }
}

