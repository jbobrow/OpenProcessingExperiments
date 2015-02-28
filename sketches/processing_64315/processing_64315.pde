
import processing.opengl.*;
    //回転角度
    private float a;
    
    //立方体の数
    private static final int NUM = 25;
    private float offset = PI/NUM;
    
    //色のグラデ
    private color[] colors = new color[NUM];
    
    public void setup() {
        size(400,400,OPENGL);
        noStroke();
        colorMode(HSB,360,100,100,100);
        //グラデーション定義
        for(int i=0; i<NUM; i++){
            colors[i] = color(i*2+100,70,100,25);
        }
    }

    public void draw() {
        background(0);
        //ライト
        ambientLight(63,31,31);
        directionalLight(255, 255, 255, -1, 0, 0);
        pointLight(63, 127, 255, mouseX, mouseY, 200);
        spotLight(100, 100, 100, mouseX, mouseY, 200, 0, 0, -1, PI, 2);
                        
        for(int i=0; i<5; i++){
            for(int j=0; j<5; j++){
                pushMatrix();
                translate(width/5*i,height/5*j);
                fill(colors[i*j]);
                rotateY(a+offset*i*j);
                rotateX(a/2+offset*i*j);
                rotateZ(a/3+offset*i*j);
                box(width/5);
                popMatrix();
            }
        }
        a+=0.01;
    }


