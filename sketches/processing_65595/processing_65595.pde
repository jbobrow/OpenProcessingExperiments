
//the class node has several functions as listed down:
// node object: posx,posy,mainword,[]wordsrelated
//1.getpos  : get the position of the node ,return the node object,isclicked
//2.getradius:get the radius for bubble
//3.getword : get the text content to be shown 
//4.getwords: get the related words
//5.paintme : draw the picture you want
class node
{
   float posx=1;
   float posy=1;
   String []wordsrelated;
   String mainword;
   float radius;
   boolean isclicked = false;
   boolean altercolor = false;
   void getpos(float x1,float y1)
   {
     this.posx = x1;
     this.posy = y1;
   }
   
   void getradius(float x)
   {
     this.radius = x;
   }
   
   void getword(String word)
   {
     this.mainword = word;   
   }
   
   void getrelwords(String []wordsrel)
   {
     this.wordsrelated = wordsrel;
   }
   
   void paintme()
   {
     if(!altercolor){
     fill(190,245,54);
     }
     else{
     fill(31,206,102);
     }
     while((this.posy<3)|(this.posy>height+2))
     {
       this.posy += random(-3.0,3.0);
     }
     ellipse(this.posx+10,this.posy,this.radius,this.radius);
     fill(245,56,22);
     if(this.mainword!=null){
     text(this.mainword,this.posx-24,this.posy+9);
   }
   }
   
   void moveself(float posx,float posy)
   {
     float shitx = (posx - this.posx)/10;
     float shity = (posy - this.posy)/10;
     for(int i = 0;i<10;i++)
     {
       this.posx+=shitx;
       this.posy+=shity;
       background(247,75,150);
       this.paintme();
       delay(20);
     }
   }

}

