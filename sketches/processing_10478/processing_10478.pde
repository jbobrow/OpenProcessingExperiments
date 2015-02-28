
/**
* Ellipses by Krystof Pesek (Kof), licensed under Creative Commons Attribution-Share Alike 3.0 license.
* Work: http://openprocessing.org/visuals/?visualID= 10478
* License: http://creativecommons.org/licenses/by-sa/3.0/
*
* visit more @ http://vimeo.com/kof
* if you leave this header, bend, share, spread the code, it is a freedom!
*
*   ,dPYb,                  ,dPYb,
*   IP'`Yb                  IP'`Yb
*   I8  8I                  I8  8I
*   I8  8bgg,               I8  8'
*   I8 dP" "8    ,ggggg,    I8 dP
*   I8d8bggP"   dP"  "Y8ggg I8dP
*   I8P' "Yb,  i8'    ,8I   I8P
*  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
*  88P      Y8P"Y8888P"    PI8"8888
*                           I8 `8,
*                           I8  `8,
*                           I8   8I
*                           I8   8I
*                           I8, ,8'
*                            "Y8P'
*
*/

int num = 60;
Ellipse e[] = new Ellipse[num];

//char[] chars = {'0','1','2','3','4','5','6','7','8','9','-','<'};

void setup(){

	size(400,300,P3D);
	for(int i = 0;i<num;i++)
		e[i] = new Ellipse(width/2,height/2,0,i);

	noFill();//(255,0,0,40);
	noSmooth();


       // textFont(createFont("Veranda",14,true,chars));
      //  textMode(SCREEN);
        
         

}

void draw(){
	background(0);
	for(int i = 0;i<num;i++)
		e[i].draw();
}

class Ellipse{

	float x,y,z;
	PVector rot;
	int id;
	float dens = 0.1;
	float r = 100.0;

	float rate = 100.0;
	float speed = 0.02;
        int segno;

	Ellipse(float _x,float _y,float _z,int _id){
		x=_x;
		y=_y;
		z=_z;
		id=_id;
                segno = (int)random(40);

		rot = new PVector(random(-1,1),random(-1,1),random(-1,1));
	}
	
	void follow(){
		x+=(mouseX-x)/(20.0);
		
		y+=(mouseY-y)/(20.0);
	}

	void draw(){
		//follow();
		
		rot.add(
		        noise((id+frameCount)/rate)*speed,
		        noise((id+34.0+frameCount)/rate)*speed,
		        noise((id+409.0+frameCount)/rate)*speed
		);

		pushMatrix();
		translate(x,y,z);

		pushMatrix();
		rotateX(rot.x);
		rotateY(rot.y);
		rotateZ(rot.z);

                int cnt = 0;
                
		beginShape();
		for(float f = -PI;f<PI;f+=dens){
                        float X = cos(f)*r;
			float Y = sin(f)*r;
			                      
  
                        if(abs(cnt-segno)<5){
                         // pushStyle();
                         // fill(255,map(modelZ(X,Y,0),-r,r,0,255));
                         // text("<-"+segno,modelX(X,Y,0),modelY(X,Y,0));
                         // popStyle();
                          stroke(#ffdddd,map(modelZ(X,Y,0),-r,r,1,180-abs(cnt-segno)*30));
                        
                        }else{
                          
                         stroke(#ffffff,map(modelZ(X,Y,0),-r,r,1,60)); 
                        
                        }
                        
			 strokeWeight(map(modelZ(X,Y,0),-r,r,5,1.8));
			
			vertex(X,Y,0);
                        cnt++;
		}
		endShape(CLOSE);
                
                 if(frameCount%2==0)
                segno++;
                if(segno>=cnt){
                 segno=0; 
                }
/*
                cnt = 0;
                for(float f = -PI;f<PI;f+=dens){
                   if(cnt==segno){
                      stroke(#ff0000,map(modelZ(X,Y,0),-r,r,0,200));  
                       float X = cos(f)*r;
			float Y = sin(f)*r;
                        strokeWeight(map(modelZ(X,Y,0),-r,r,5,1.8));
                        line(X,Y,lerp(X,0,0.1),lerp(Y,0,0.1));
                        }
                         cnt++;
                }
                */
		popMatrix();
		popMatrix();

                
	}
}


