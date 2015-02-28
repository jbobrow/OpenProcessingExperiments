
//import processing.video.*;
import processing.opengl.*;
import codeanticode.glgraphics.*;
import codeanticode.gsvideo.*;
//import tsps.*;
//width of active area ( used to scale bounding boxes )
float     activeWidth;
float     activeHeight;
//UI ui;
//custom people objects
ArrayList customPeople;
String backgrounds[] = new String[20];
//pseudoHumo metaball;
//PelosBG myPelos;
GSMovie myMovie;
TSPS tspsReceiver;
int       currentBackground = 0;
ParticleSystem ps;
PVector centro;
boolean somebody;
//GL GRPH
GLTexture texSrc, texFiltered, texFiltered2, texMovie, texFinal;
GLTextureFilter blurFilter, pixelateFilter, extractBloom, blend3;
void setup(){
          size(1024,768,GLConstants.GLGRAPHICS);
      hint( ENABLE_OPENGL_4X_SMOOTH );
          activeWidth = 1024;
          activeHeight = 768; //to accomadate for status bar
          customPeople = new ArrayList();
      //frameRate(100);
          //all you need to do to start TSPS
          tspsReceiver= new TSPS(this, 12000);
      myMovie = new GSMovie(this, "arbol_lento3.mov");
     myMovie.loop(); //Ejecuto de fondo siempre la pelicula
     //GL textures
     texSrc = new GLTexture(this);
     texFiltered = new GLTexture(this);
     texFiltered2 = new GLTexture(this);
     texMovie = new GLTexture(this);
     texFinal = new GLTexture(this);
     blurFilter = new GLTextureFilter(this, "Blur.xml");
     pixelateFilter = new GLTextureFilter(this, "pixelate.xml");
     pixelateFilter.setParameterValue("pixel_size",10.0f);
     blend3 = new GLTextureFilter(this, "Blend3.xml");
     extractBloom = new GLTextureFilter(this, "ExtractBloom.xml");
     extractBloom.setParameterValue("bright_threshold", 0.8);
     //extractBloom.apply(srcTex, tex0);
     //moscas
     ps = new ParticleSystem(3000);
     //Realizo una ejecución inicial para poblar de moscas las escena
     centro = new PVector(width/2,0);
     somebody=false;
     // La llamada que hago luego es
update(rectX,rectY,rectWidth,RectHeigth,centro,somebody);
    // ps.run(768,0,0,384,centro,somebody);
};
void draw(){
     background(0);
     myMovie.read();
     texMovie.putPixelsIntoTexture(myMovie);
     image(texMovie,0,0,width,height);
     //image(myMovie,0,0,width,height);
          //loop through custom person objects
          tspsReceiver.update();
     int iter = customPeople.size()-1;
     //println(iter);
     if(iter >= 0) {
       CustomPerson finalPerson = (CustomPerson) customPeople.get(iter);
       for (int i=customPeople.size()-1; i>=0; i--){
                     CustomPerson p = (CustomPerson) customPeople.get(i);
                     if (!p.dead) {
                 if(p.area > finalPerson.area) {
                   finalPerson = (CustomPerson) customPeople.get(i);
                 }
              } else {
                  customPeople.remove(i);
                }
                     //else customPeople.remove(i);
           }
        somebody=true;
        finalPerson.draw(texSrc,texFiltered,texFiltered2,blurFilter,extractBloom);
        blend3.apply(new GLTexture[]{texFiltered2, texFiltered, texFiltered2}, new
GLTexture[]{texFinal});
        image(texFinal,171,310,600,478);
ps.run((finalPerson.boundingRect.x*activeWidth)/*+(171)*/,(finalPerson.boundingRect.y*
activeHeight)+256,finalPerson.boundingRect.width*activeWidth*0.585,finalPerson.bound
ingRect.height*activeHeight*0.62,finalPerson.centroid,somebody);
      } else {
        somebody=false;
        //blend3.apply(new GLTexture[]{texFiltered2, texFiltered, texFiltered2}, new
GLTexture[]{texFinal});
        //image(texFinal,0,0,1024,768);
        ps.run(768,0,0,384,centro,somebody);
     }
      //metaball.draw();
       //He quitado esto de aqui y lo he metido en el bucle
       //blend3.apply(new GLTexture[]{texFiltered2, texFiltered, texFiltered2}, new
GLTexture[]{texFinal});
       //image(texFinal,0,0,1024,768);
};
void personEntered( TSPSPerson p ){
           CustomPerson person = new CustomPerson(p,activeWidth, activeHeight);
           //person.loadBackground( backgrounds[currentBackground]);
           //currentBackground++;
           //if (currentBackground >= 20) currentBackground = 0;
           customPeople.add(person);
           //ui.personEntered();
}
void personUpdated( TSPSPerson p ){
           for (int i=0; i<customPeople.size(); i++){
                     CustomPerson lookupPerson = (CustomPerson) customPeople.get(i);
                     if (p.id == lookupPerson.id){
                               lookupPerson.update(p);
                               break;
                     }
           }
           //ui.personUpdated();
}
void personLeft( TSPSPerson p ){
  println("person left with id " + p.id);
          for (int i=0; i<customPeople.size(); i++){
                     CustomPerson lookupPerson = (CustomPerson) customPeople.get(i);
                     if (p.id == lookupPerson.id){
                               //lookupPerson.update(p);
                   lookupPerson.dead = true;
                   //customPeople.remove(i);
                               break;
                     }
          }
          //ui.personLeft();
}
void movieEvent(GSMovie movie)
{
   movie.read();
}

                
