
rosace[] collection;
int temps =60;

void setup(){
  size(800,600);
  smooth();
  collection = new rosace[temps];
  for(int i=0;i<temps;i=i+1){
    collection[i]=new rosace(random(width),random(height));
  }
   noFill();
}

void draw(){
 background(0); 

 println(collection.length);
 
 for(int i=0;i<collection.length;i=i+1){
   collection[i].update();
   if (collection[i].vie>collection[i].mort){collection[i].initialize();}
   }
   
 
 }




class rosace{
  float x;
  float y;
  float vie;
  float rayon;
  int mort;

  
  rosace(float x,float y){
    this.x=x;
    this.y=y;
    this.vie=0;
    this.rayon=0;
    this.mort=int(random(40,100));



  }
  
void  update(){
  
  vie=vie+1;
  if (vie<mort/2) {rayon=rayon+1;}
  else {rayon=rayon-1;}
 
  dessine();
  }
  
void initialize(){
    this.x=random(width);
    this.y=random(height);
    this.vie=0;
    this.rayon=0;
    this.mort=int(random(40,100));
}

void dessine(){
  int n=int(rayon);
 
  pushMatrix();  // enregistre le repère courant
  translate(x,y); // translate le repère , l'origine est désormais le centre de la rosace
  for(int i=1;i<=n;i=i+1){
     stroke(255,map(rayon,0,mort/2+i,0,230));
    rotate(TWO_PI/n);   // tourne le repère 
    ellipse(rayon,0,rayon*2,rayon*2); // trace toujours la même ellipse mais dans le nouveau repère
  }
  popMatrix(); // rétablit le style enregistré précédemment

}
}



