
/*@pjs preload="shape.png";*/

PImage img;   
 
size(300, 300);     //画面のサイズ
background(196,0,204);     //背景色
img = loadImage("shape.png");     //ファイルから画像を読んで、imgに格納
 
tint(0, 153, 0);      //色彩をつける（赤, 緑, 青）
image(img, 0, 0);  
tint(0, 0, 255, 127);      //色彩をつける（赤, 緑, 青） 
image(img, 150, 150, 150, 150); 



strokeWeight(3); 


stroke(106, 3, 252); 


noFill(); 


  


rect(90,70,130,190); 




