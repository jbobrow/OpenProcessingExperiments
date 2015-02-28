
  /**
* MEM by Krystof Pesek (Kof), licensed under Creative Commons Attribution-Share Alike 3.0 license.
* Work: http://openprocessing.org/visuals/?visualID= 10759
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

int num = 2;

String instr;
Driver d[];

boolean theEnd = false;

char ch[] = {'K','O','F','I','N'};

void setup(){
	size(540,220,P2D);
	instr = "1";

        textFont(createFont("Veranda",9,true,ch));
	textMode(SCREEN);
	

	d = new Driver[num];
	for(int i =0;i<num;i++)
		d[i] = new Driver(i+1);
	background(0);
        noSmooth();
}


void draw(){
	stroke(-1);
        tint(#fafa00);
        
        if(d.length>=25&&frameCount%2==0&&!theEnd)
        g.filter(ERODE);
                
        image(g,noise(frameCount/1.0),noise((2309.2+frameCount)/1.0));
         
        if(d.length>=30)
          theEnd = true;
         
        if(!theEnd){	
	for(int i =0;i<d.length;i++)
	d[i].draw();
	

	if(frameCount%60==0){
		int q= (int)random(1,8);
		for(int i =0;i<10;i++)
			instr += ""+q;//loadStrings("driver.txt")[0];
                if(d.length<30)
                d = (Driver[])append(d,new Driver(d.length+1));

	}

	stroke(0,250);
	noFill();
	strokeWeight(30);
	rect(0,0,width,height);
        }else{
          textAlign(CENTER);
           fill(255,120);
           text("FIN\nKOF",noise(frameCount/1.0)*1.5+width/2,noise((2309.2+frameCount)/1.0)*1.5+height/2);
         
          
       }
}

class Driver{
	String dna="";
	int x,y,lx,ly;
	int pos = 0;
	int id;
	int mod;

	Driver(int _id){
		id=_id;
		mod = (int)(id);
		x = lx = (int)random(width);
		y = ly = (int)random(height);

		update();
	}

	void update(){
		dna = instr+"";
		pos = 0;
	}

	void draw(){
		switch(dna.charAt(pos)){
			case '1':
				x-=1*mod;
				y-=1*mod;
			break;
			
			case '2':
                                y-=1*mod;
                        break;
 
			case '3':
                                x+=1*mod;
                                y-=1*mod;
                        break;
 			
			case '4':
                                x-=1*mod;
                        break;
 			
			case '5':
                                x+=1*mod;
                        break;

			case '6':
                                x-=1*mod;
                                y+=1*mod;
                        break;

			case '7':
                                y+=1*mod;
                        break;

			case '8':
                                x+=1*mod;
                                y+=1*mod;
                        break;

		}

                stroke(-1,map(id,0,d.length-1,255,50));
		strokeWeight(constrain(mod,1,20));

                for(int i = 0;i<10;i++)
		line(x,y,lx,ly);
		
		limit();
		lx=x;
		ly=y;
		pos++;
		if(pos>=dna.length()){
			update();
		}

	}

	void limit(){
	if(x>width)
	x=0;

	if(x<0)
	x=width;

	if(y>height)
	y=0;

	if(y<0)
	y = height;
	}

}

