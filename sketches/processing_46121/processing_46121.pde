
//yi-ting sie
//回家作業:spring
//透過由線條構成，所表現出上下起伏的面，來呈現春風吹拂布面的感覺，讓人感覺春天來臨之意。當滑鼠移動到畫面時，會變更布面的顏色，以傳達春天的多樣貌。
//Sheng-Fen Nik Chien (2011), 課程講義：Randomness & Noise, http://moodle.ncku.edu.tw/course/view.php?id=43022.
//Craig Moffat (2011), Gauze 3D, http://www.openprocessing.org/visuals/?visualID=17397.
//Processing Reference (2011), map(), C:\Users\Administrator\Desktop\processing-1.5.1-windows\processing-1.5.1\modes\java\reference\map_.html.


void setup() {  
  size(500, 500, P3D);//畫面3D尺寸
}  

float NoiseScale = 0.005;//噪音規模  
float NoiseOffsetX, NoiseOffsetY;//X軸的噪音偏移位置, Y軸的噪音偏移位置    

void draw() {  
  background(255);  
  fill(100, 150, 250, 100);
  stroke(mouseY, 200, 220, 100); //顏色 
  for (float i=10; i<450;i++) {  
    NoiseOffsetX +=4;//X軸的噪音偏移位置
    NoiseOffsetY +=1;//Y軸的噪音偏移位置    
    drawspring();
  }
}  

void drawspring() {  
  float ax =0;  //X軸的位置
  float ay = height/1.5; //Y軸的位置 
  //float aay = height/3;
  //float aaay = height/4;
  float bx = 5;  
  float by = 5;  
  float pcnt = 5;  

  while ( (ax>=0) && (ax<width) && (ay<height) && (ay>=0)) {  
    point(ax, ay); //起點 
   // point(ax, ay-100); //起點 
    float xNoise = noise((pcnt+NoiseOffsetX) * NoiseScale);//X的噪音  
    float yNoise = noise((pcnt+NoiseOffsetY) * NoiseScale);//Y的噪音 

    bx = ((2.5*bx) + 0.8 + map(xNoise, 0, 1, -1, 1))/4.0;//map(值，低，高，低，高)  
    by = ((2.5*by) - 0.05 + map(yNoise, 0, 1, -1, 1))/4.0;

    ax += 1.3*bx;  
    ay += 1.2*by;  
    
    pcnt++;
  }
}

void mousePressed() {  
  saveFrame("spring001.jpg");
}


