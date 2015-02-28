
// Joshua Daniel DEC. 2011
void setup(){
size (600,300);
  smooth();
artVis();

}
void draw(){
  artVis();
}

void artVis (){

  background(165);
String[] artsize= loadStrings("size.txt");
String[] concept= loadStrings("concept.txt");
String[] artcolor= loadStrings("colors.txt");
String[] names = loadStrings("text.txt");
String[] locations= loadStrings("locations.txt");

//

for(int i = 0; i <locations.length; i++) {
    String [] pieces = split(locations[i],TAB);
       float x = parseFloat(pieces[0]);
       float y = parseFloat(pieces[1]);
    
    String[] pieces2 = split(artsize[i],TAB);
       float u = parseFloat(pieces2[1]);
       float v = parseFloat(pieces2[2]);
   
    String[] pieces3 = split(concept[i],TAB);
       float s = parseFloat(pieces3[1]);
       float t = parseFloat(pieces3[2]);
     
    String[] pieces4 = split(artcolor[i],TAB);
       float r = parseFloat(pieces4[0]);
       float q = parseFloat(pieces4[1]);
       float p = parseFloat(pieces4[2]);
     
     //
     
     if (dist(mouseX,mouseY,x,y)<27){
   background(p,p,p);
       stroke(78,30,0);
       fill(r,q,p); 
      
      ellipse(u*20,u*20,u*20,v*20);
     fill(q,p,r);
      
      bezier(v*50,u*10,u*5,u*15,t*5,s*5,v*50,s*40);
          fill(p,q,r);
      bezier(u*10,15*v,u*20,u*15,t*30,s*5,u*20,v*30);
            fill(r,q,p);
      bezier(u*10,noise(15*t),u*5,t,t*5,s*5,u*20,u*5);
              fill(p,r,q);
      bezier(v*20,t,u*5,u*15,t*5,s*5,t*20,u*20);
              
           line(v,u,t,s) ;
           bezier(u*v,t,s,t,v,t*u,r,p);
   fill(78,30,0);
   textSize(25);
   text(names[i],10,260);
  
    }
  }
}






