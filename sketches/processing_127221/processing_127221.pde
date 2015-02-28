
/* @pjs preload = "GIF - Compuserve GIF.png,oa27.png,momusi4.png"; */
import processing.opengl.*;
 int angle; 
 float noiseScale = 0.04;
 PImage img;

void setup() {
    size(450, 450, P3D);//p3ddegamennookisa
    noStroke();
    fill(255,190);
    angle = 0;    

}
 
void draw() {
  img = loadImage("oa27.png");//tenpugazou
    ambientLight(70, 29, 29); //heikougen
    directionalLight(255,255,255,-1,0,0); //tenkougen
    pointLight(63, 127, 255, mouseX, mouseY, 200); //spottraito
    spotLight(100, 100, 100, mouseX, mouseY, 200, 0, 0, -1, PI, 2);//PI=ensyuuritu 
    
    int dim = 18;
     angle += 1;    //1dozutukaiten

             translate(width/2 , height/5);    //gazouichiidou
             rotateY(radians(angle));    //YzikunitaisiANGLEnosuuchidakekaidou
             image(img,0,0);    
    
}

void mousePressed(){
    color c = get(mouseX, mouseY); //mausukrickdeirohenkou
    background(c);
    float value = saturation(c); //saidonoataidekaitenteisi
        if (value <100) {

           rotateY(-radians(angle));    //Yzikunohenkanwomodosu
           translate(width/angle-230, height/angle-90); //haikeimodsitonosizusyori     
 
           for(int i=0; i<width; i++){
             for(int j=0; j<height; j++){
           stroke( 255*noise(i*noiseScale,j*noiseScale) );
           point(i,j);
                                         }
                                      }
        img = loadImage("GIF - Compuserve GIF.png"); //ringowohensyoku
        image(img, width/angle+138, height/angle+115, width/2.75, height/2.75);//hennsyokurinngoitisitei
        noLoop();
        img = loadImage("momusi4.png");
        image(img, width/angle+215, height/angle+115, width/2.25, height/2.75);//momusiitisitei
                        }

}




