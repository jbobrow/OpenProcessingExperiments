
PImage img;
SwarmMabuta swarm_mabuta;
Mabuta mabuta;
void setup(){
  size(640, 420);
  // load eye image
  img = loadImage("eye_image_mini.png"); 
  // create 150 mabutas
  swarm_mabuta = new SwarmMabuta(150); 
}

void draw(){
  background(255);
  Delay(150);
  swarm_mabuta.Draw();
}

void mousePressed(){
  int rand_size = (int)random(20,40);
  swarm_mabuta.Add(new Mabuta(mouseX-rand_size/2,mouseY-rand_size/2,rand_size,(int)random(1,2),img));
}

void Delay(int ms){
  int time = millis();
  while(millis()- time <= ms);
}

/**
 * @brief Mabuta class. 
 *        moving kurome.
 */
class Mabuta {
  int posx; // position of a mabuta
  int posy; // position of a mabuta
  int size; // size of a mabuta
  int num_iris; // the number of KUROMEs  
  PImage img_eye; // image's mabuta

  int eye_center_x;
  int eye_center_y;
  int[] iris_x; // stor the positions of KUROME
  int[] iris_y; // stor the positions of KUROME
  int[] iris_size; // stor the sizes of KUROME

  /**
   * @brief Constructor of Mabuta
   */
  Mabuta(int posx, int posy, int size, int num_iris, PImage img_eye) {
    // setting members
    this.posx = posx;
    this.posy = posy;
    this.size = size;
    this.num_iris = num_iris;
    this.img_eye = img_eye;

    // calcurate the center of position of mabuta
    this.eye_center_x = posx+size/2;
    this.eye_center_y = posy+size/2;

    iris_x = new int[num_iris];
    iris_y = new int[num_iris];
    iris_size = new int[num_iris];

    // random positions and size 
    for (int i=0; i<num_iris; i++) {      
      iris_x[i] = eye_center_x;
      iris_y[i] = eye_center_y;
      iris_size[i] = (int)random(size/3, size/1.8);
    }
  }

  void Draw() {
    Update();
    int size_x = (int)(size*1.5);
    fill(255);
    noStroke();
    ellipse(eye_center_x+size/5, eye_center_y, size*1, size);
    for (int i=0; i<num_iris; i++) {               
      int arrange = (int)(iris_size[i]/2*1.2);  
      // drawing iris      
      fill(240);
      smooth();
      stroke(100);      
      ellipse(iris_x[i]+arrange+i*10, iris_y[i]+i*2, iris_size[i], iris_size[i]);
      noStroke();
      fill(200);
      ellipse(iris_x[i]+arrange+i*10, iris_y[i]+i*2, iris_size[i]/3, iris_size[i]/3);
    }
    //drawing mabuta  
    image(img_eye, posx, posy, size_x, size);
  }

  /**
   * @brief move Medama
   */
  void Update() {
    for (int i=0; i<num_iris; i++) {
      int rand_x = (int)tan(random(-1.5, 1.5));
      int rand_y = (int)tan(random(-1.4, 1.4));
      iris_x[i] = this.eye_center_x+ rand_x;
      iris_y[i] = this.eye_center_y + rand_y;
    }
  }
  

}

/**
* @brief This class has swarm of mabutas
*/
class SwarmMabuta{
  // members
  ArrayList<Mabuta> mabutas;
  int size_swarm;
  
  // constructor 
  SwarmMabuta(int size_swarm){
  this.size_swarm = size_swarm;
  mabutas = new ArrayList<Mabuta>();
   Mabuta mabuta;
   for(int i=0;i<size_swarm;i++){
     int rand_size = (int)random(20,60);
     mabuta = new Mabuta((int)random(0,width),(int)random(0,height),rand_size,(int)random(1,2),img);
     mabutas.add(mabuta);
   }
  }
   
  void Draw(){  
    for(int i=0; i<mabutas.size(); i++){
      Mabuta mabuta = mabutas.get(i);
      mabuta.Draw();  
    }
    
  }

  void Add(Mabuta m){
    mabutas.add(m);
  }
}



