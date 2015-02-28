
// dna1: DNA substitution simulation for learning molecular evolution 2010/06/25
// Jukes-Cantor model
// Hidetoshi Shimodaira shimo@is.titech.ac.jp 2010 GPL

// USAGE
//   Press 0 for restarting the simulation.
//   Press 1 for increasing time by 1 unit. 
//   Press 2 for starting/stopping the simulation.
//   Press c for showing/hiding the number of changes of sites.
//   Press i for detailed information.
//   Press S/s/l/L to reset the sequence length (50/100/1000/10000).
//
// NOTE
//  When time=0, seq1 and seq2 are set to seq0.
//  By increasing time, random changes are made to seq1 and seq2 independently.
//  Here, we make 1 change on average in 1 time unit.
//  For small time value, the number of differences between seq1 and seq2 
//     (may be named as diff12) is approximately twice of time.
//  For larger time value, diff12 will be saturated at 75% of sequence length.
//  We can only observe diff12 in practice, and estimate time.
//  The "estimate" is a time computed from diff12 via the theoretical curve.
//  The estimate becomes accurate by increasing sequence length (say 1000).
//  The number of changes made to seq1 (denoted as change1)
//     is approximately equal to time.
//  Also the number of changes made to seq1 (denoted as change2)
//     is approximately equal to time.
//  So, the sum of the numbers of changes made to seq1 and seq2 
//     (denoted as change1+change2) is approximately twice of time.
//  Diff12 is smaller (or at most equal to) change1+change2.
//  In practice, we cannot estimate the absolute time (such as years)
//    unless we know the rate of changes in a year.
//  So we actually estimate change1+change2 from diff12. Here we assumed
//    that the rate of change is 1 per time unit, and simply compute
//    the esimated time = (change1+change2)/2.

void keyPressed() {
    switch(key) {
    case '0': // reset
	reset();
	break;
    case '1': // *** single step
	stepcnt=1;
	break;
    case '2': // *** toggle run/stop
	flagchange=!flagchange;
	break;
    case 'l': // long sequence
	dnalen=1000;
	reset();
	break;
    case 'L': // very long sequence
	dnalen=10000;
	reset();
	break;
    case 's': // short sequence
	dnalen=100;
	reset();
	break;
    case 'S': // very short sequence (default)
	dnalen=50;
	reset();
	break;
    case 'i': // toggle info
	flaginfo=!flaginfo;
	break;
    case 'c': // toggle show changes
	flagshowchg=!flagshowchg;
	break;

    default:
    }
}

char dnachar[] = {'A','T','G','C'};
int dnahue[] = {0,100,180,220};
int dnalen;
int dnafontx;
float dnalambda=1.0; // the actual lambda := dnalambda/dnalen

boolean flagchange;
boolean flaginfo;
boolean flagshowchg;
int stepcnt;

PFont font; // regular font
PFont font2; // font for changed sites

// generate Poisson random variable
int rpoi(float lambda){
    float L;
    int k;
    float p;
  
    L=exp(-lambda);
    k=0;
    p=1;
  
    do {
	k++;
	p *= random(0,1);
    } while(p>L);
  
    return k-1;
}


// dna sequence
class dnaseq {
    int len; // length
    int[] seq; // dna sequence 0=a, 1=t, 2=g, 3=c
    int[] chg; // number of changes

    dnaseq(int len){
	this.len = len;
	seq = new int[len];
	chg = new int[len];
	for(int i=0;i<len;i++) seq[i]=(int)random(4);
    }

    dnaseq(dnaseq org){
	len = org.len;
	seq = new int[len];
	chg = new int[len];
	for(int i=0;i<len;i++) {
	    seq[i]=org.seq[i];
	    chg[i]=org.chg[i];
	}
    }

    char[] toChar(){
	char cseq[] = new char[len];
	for(int i=0;i<len;i++) cseq[i]=dnachar[seq[i]];
	return cseq;
    }

    void change() {
	change((int)random(len));
    }

    void change(int site) {
	int j=(int)random(dnachar.length-1);
	if(j>=seq[site]) j++;
	seq[site]=j;
	chg[site]++;
    }

    void show(int x, int y, int z, int b, int len) {
	if(len>this.len) len=this.len;
	for(int i=0;i<len;i++) {
	    int s=seq[i];
	    if(chg[i]==0) {
		textFont(font);
		fill(dnahue[s],z,b);
	    } else {
		textFont(font2);
		fill(dnahue[s],z,0.5*b);
	    }
	    int c=chg[i];

	    if(flagshowchg) {
		if(c>9) c=9;
		text(c,x+i*dnafontx,y);
	    } else {
		text(dnachar[s],x+i*dnafontx,y);
	    }

	}

	textFont(font);
    }

    int compare(dnaseq qq) {
	int cnt=0;
	if(this.len<=qq.len) {
	    for(int i=0;i<len;i++) 
		if(this.seq[i]!=qq.seq[i]) cnt++;
	    cnt+=qq.len-this.len;
	} else {
	    for(int i=0;i<qq.len;i++) 
		if(this.seq[i]!=qq.seq[i]) cnt++;
	    cnt+=this.len-qq.len;
	}
	return cnt;
    }
}

int x0,y0,w0,h0;

float mapx(float x) {
    return x0+map(x,0,dnalen,0,h0);
}

float mapy(float y) {
    return y0-map(y,0,dnalen,0,h0);
}

class graph {
    int len;
    float[] xbuf;
    float[] ybuf;
    color col;
    int width;

    graph(int len) {
	this.len = len;
	xbuf = new float[len];
	ybuf = new float[len];
    }

    void pen(color col, int width) {
	this.col = col; this.width = width;
    }

    void set(int i, float x, float y) {
	xbuf[i]=x; ybuf[i]=y;
    }

    void draw() {
	stroke(col);
	strokeWeight(width);
	for(int i=1;i<len;i++) 
	    line(mapx(xbuf[i-1]),mapy(ybuf[i-1]),mapx(xbuf[i]),mapy(ybuf[i]));
    }

}


void setup() {
    smooth();
    size(1000,650);
    colorMode(HSB,360,100,100);
    font = loadFont("CourierNewPS-BoldMT-24.vlw");
    font2 = loadFont("Verdana-Bold-20.vlw");
    textFont(font);

    dnafontx = 16;
    dnalen=50;
    reset();
}


dnaseq seq0,seq1,seq2;

int step;
int change1;
int change2;
int diff01;
int diff02;
int diff12;

graph plot12;

void reset() {

    seq0 = new dnaseq(dnalen);
    seq1 = new dnaseq(seq0);
    seq2 = new dnaseq(seq0);

    step=diff01=diff02=diff12=change1=change2=0;
    flagchange=false;
    flaginfo=false;
    flagshowchg=false;
    stepcnt=0;

    int n=200;
    plot12 = new graph(n);
    plot12.pen(color(210,53,80),5);
    for(int i=0;i<n;i++) {
	float x=map(i,0,n,0,dnalen*1.7);
	float y=dnalen*(3.0/4.0)*(1.0-exp(-(4.0/3.0)*(2.0*dnalambda/dnalen)*x));
	print("("+x+","+y+") ");
	plot12.set(i,x,y);
    }

    
}


void draw(){
    color c0=color(20,60,50);
    background(60,11,89);
    
    x0=10; y0=40;
    fill(c0);
    text("seq0",x0,y0);
    seq0.show(x0+80,y0,85,90,100); y0+=20;
    fill(c0);
    text("seq1",x0,y0);
    seq1.show(x0+80,y0,85,90,100); y0+=20;
    fill(c0);
    text("seq2",x0,y0);
    seq2.show(x0+80,y0,85,90,100);


    x0=100; y0=120;
    fill(296,63,42);

    float x,hattime;
    x=1.0-diff12*(4.0/3.0)/dnalen;
    if(x<=0.0) hattime=dnalen*2;
    else hattime=-(3.0/4.0)*(dnalen/(2.0*dnalambda))*log(x);
    if(flaginfo) {
	text("length: "+ dnalen+"   lambda: "+dnalambda/dnalen+"   model: Jukes-Cantor",x0,y0); 
	y0+=25;
	text("time: "+ step+"    estimate: "+round(hattime),x0,y0); y0+=30;
	text("seq0  => seq1: "+ change1 +" changes, "+ diff01+" differences", x0,y0); y0+=25;
	text("seq0  => seq2: "+ change2 +" changes, "+ diff02+" differences", x0,y0); y0+=25;
	text("seq1 <=> seq2: "+ (change1+change2)+ " changes, "+ diff12+" differences" ,x0,y0); y0+=30;
    } else {
	text("length: "+ dnalen,x0,y0); y0+=25;
	text("time: "+ step+"    estimate: "+round(hattime),x0,y0); y0+=30;
	text("seq1 <=> seq2: "+ diff12+" differences" ,x0,y0); y0+=30;
    }

    x0=700; y0=400;
    stroke(296,63,42);
    strokeWeight(2);
    fill(c0);
    text("seq0",x0,y0);
    text("seq1",x0-100,y0+100);
    text("seq2",x0+100,y0+100);
    x0+=20;
    line(x0,y0+10,x0-100,y0+80);
    line(x0,y0+10,x0+100,y0+80);


    x0=80; y0=600; w0=800; h0=480;
    fill(188,66,59);
    stroke(188,66,59);
    strokeWeight(5);
    line(x0,y0,x0+w0,y0);
    line(x0,y0,x0,y0-h0);
    text("time",x0+w0/2-20,y0+25);
    pushMatrix();
    translate(x0-20,y0-80);
    rotate(-HALF_PI);
    text("seq1 <=> seq2 (differences)",0,0);
    popMatrix();
    
    plot12.draw();

    stroke(341,88,90);
    strokeWeight(20);
    point(mapx(step),mapy(diff12));

    if(flagchange|| stepcnt>0) {
	step++;
	stepcnt--;
	int r1=rpoi(dnalambda);
	int r2=rpoi(dnalambda);
	for(int i=0;i<r1;i++) seq1.change();
	for(int i=0;i<r2;i++) seq2.change();
	change1+=r1;
	change2+=r2;
	diff01=seq0.compare(seq1);
	diff02=seq0.compare(seq2);
	diff12=seq1.compare(seq2);
    }

    
}


