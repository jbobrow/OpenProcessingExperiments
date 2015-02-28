

String[]data;//array to store our data
ArrayList Itunes = new ArrayList();

int xp =20;
int yp =25;
 

PFont font;

void setup(){
  
   background(200);
   size(1000,700);
   smooth();
   data = loadStrings("iTunesData.csv");
   
    font = createFont("Helvetica",12);
   
   for (int i=1; i<data.length; i++){ // run through the data - skip the header row
    Itune newItune = new Itune(data[i]);
    Itunes.add(newItune);
  }
   //noLoop();


}


void draw(){
  
   xp =20;
   yp =25;
   background(200);

   //scale(0.1);
   for(int i = 0; i<Itunes.size(); i++){
     Itune I = (Itune)Itunes.get(i);
     //fill(255);
     noStroke();
    // ellipse(xp,yp,I.plays*2,I.plays*2);
     fill(255, 0,0,I.plays*200);
     textFont(font, 6+I.plays);
     text(I.name, xp, yp);//data,x,y draw the track names
     int wd = int (textWidth(I.name));
  //println("xp:"+xp+","+"yp:"+yp);
     if (mouseX >= xp && mouseX <= xp + wd + 7.5 && mouseY >= yp-25 && mouseY <= yp){
       highLight(xp, yp, i);        
     }
     
     xp = xp + wd + 15;
    if (xp > 800){
       xp = 20;
       yp += 25;
     } 
   }
}

  void highLight(int xp, int yp, int i) {
//    
//    ArrayList h = new ArrayList();
//    Itune I = (Itune)h.get(i);
     Itune I = (Itune)Itunes.get(i);
     fill(0, 0,0,I.plays*200);
     textFont(font, 6+I.plays);
     text(I.name, xp, yp);//data,x,y draw the track names
    
     textFont(font, 180);

     text(I.plays, 400, 350);
      
    if(mouseX == xp && mouseY == yp){
     //stroke(0);  
     //strokeWeight(20);
     
    }
    
    //println("xp:"+mouseX+","+"yp:"+mouseY);
 }

