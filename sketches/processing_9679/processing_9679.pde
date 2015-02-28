

  /**
*  Waltz Of Determinism by Krystof Pesek, licensed under Creative Commons Attribution-Share Alike 3.0 license.
*  Work: http://openprocessing.org/visuals/?visualID=9679
*  License: http://creativecommons.org/licenses/by-sa/3.0/
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

String code = "";
Determin d[];
PFont font;

float step = 5.0;

color bila,cerna;

boolean negativ = true;

void setup(){
	size(800,600,P2D);

	bila = color(255);
	cerna = color(0);

	noSmooth();
	hint(ENABLE_NATIVE_FONTS);

	font = createFont("PT_Sans_Bold.ttf",18);
	textFont(font);
	textAlign(CENTER);
	textMode(SCREEN);

	d = new Determin[5];

	for(int i = 0;i<d.length;i++){
		d[i] = new Determin(width/2.0,height /3.0*2,i);
	}
}

void draw(){
	background( (negativ) ? cerna : bila);

	for(int i = 0;i<d.length;i++){
		d[i].draw();
	}

	fill((negativ) ? bila : cerna,15);


	String vata = "";
	for(int i = 0;i<abs(mouseX-width/2);i+=10){
		vata+=".";
	}
	for(int i = 0;i<10;i++)
		text("{ "+vata+" Waltz of D"+(char)(int)((noise(frameCount/20.0)*24)+92)+"terminism "+vata+" }",
		     width/2+noise(frameCount/(20.0+i))*6-3,
		     height/3.0*2+80
		    );

}

void mousePressed(){
	negativ = !negativ;
}

class Determin{

	float x,y;
	float[] rada = new float[0];
	float[] uhly = {2.0,-5.0,35.0,-90.0};
	int id;
	float follow = 0;

	Determin(float _x,float _y,int _id){
		x = _x;
		y = _y;
		code = codeGen(20,0,0,0);
		id = _id;

		for(int i =0 ;i<code.length();i++){
			rada = (float[])expand(rada,rada.length+1);
			if(code.charAt(i)=='A'){
				rada[rada.length-1] = uhly[0];
			}else if(code.charAt(i)=='B'){
				rada[rada.length-1] = uhly[1];
			}else if(code.charAt(i)=='C'){
				rada[rada.length-1] = uhly[2];
			}else if(code.charAt(i)=='D'){
				rada[rada.length-1] = uhly[3];
			}
		}

	}

	void draw(){

		follow += (((noise((frameCount+id))*10.0-5.0)+
		            map(mouseX,0,width,-400/((rada.length-step+0.1)/2.0),
		                400/((rada.length-step+0.1)/2.0))*
		            (id+0.4)-follow)/5.0
		          );

		rada[frameCount%rada.length] =  follow;

		float[] qasi = rada;

		for(int q = 1;q<40;q++){
			qasi = randomize(q);

			pushMatrix();
			translate(x,y);

			for(int i =0;i<rada.length;i++){

				rotate(radians(qasi[i]));
				stroke((negativ) ? bila : cerna,10);
				line(0,0,0,-step);
				stroke( (negativ) ? bila : cerna,5);
				line(i/2,50,0,0);
				translate(0,-step);
			}
			popMatrix();
		}
	}

	float[] randomize(int _in){
		return sort(rada,_in);
	}
}

String codeGen(int a,int b,int c,int d){
	String res = "";
	for(int i =0 ;i<a+b+c+d;i++){
		float q =  random(a+b+c+d);
		if(q<=a){
			res+="AAAAA";
		}else if(q<=a+b&&q>a){
			res+="BB";
		}else if(q<=a+b+c&&q>a+b){
			res+="C";
		}else if(q>c&&i>(a+b+c+d)/3.0){
			res+="D";
		}
	}
	return res;
}

