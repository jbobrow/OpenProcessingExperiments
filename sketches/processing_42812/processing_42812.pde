
// /**
//  *
//  * What happens when a 1D wolfram cellular automaton is rendered on the hilbert curve - making it two dimensional?
//  */

int[] states;
int rule = 110;
int n = 8;
int cnt;
int opacity = 100; 

// wikipedia suggest that theese are interesting (18 i found but)
// https://secure.wikimedia.org/wikipedia/en/wiki/Wolfram_code
int[] presets  = new int[] { 18, 30 , 110, 184, 90 };
int pidx = 0;

void setup() {
    size(512, 512);
    frameRate(5);
    rule = presets[pidx];
    n = 5;
    init_center();
    reset();
}

/**
 * use wolfram code
 * and wrap around
 */
void iterate() {
    if (states==null) return;
    int[] new_states = new int[cnt];
    int prev, cur, next;    
    prev = states[states.length-1];

    for(int i = 0; i < cnt; i++) {
	cur = states[i];
	next = states[(i+1)%states.length];

	int cur_state = prev << 2 | cur << 1 | next;
	new_states[i] = (rule >> cur_state)&1;

	prev = cur;
    }
    states = new_states;
}

/**
 * from Warren "Hackers delight" p 248
 */
PVector hilbert(int s, int n) {
    int state,x,y,row;
    state = row = x = y = 0;
    for(int i = 2 *n -2; i >= 0; i -=2) {
    row = 4 * state | (s >> i) & 3;
    x = (x << 1) | (0x936C >> row)&1;
    y = (y << 1) | (0x39C6 >> row)&1;
    state = (0x3E6B94C1 >> 2*row) & 3;
    }
    return new PVector(x,y);
}
 
void draw() {
    if (states == null) return;
    float scale = (width)/(1<<n);
    noStroke();
    for(int i = 0; i < cnt; i++) {
	PVector cur = hilbert(i, n);
	if (states[i] == 0) {
	    fill(0,0,0,opacity);
	} else {
	    fill(0, 255, 255, opacity);
	}
	rect(cur.x*scale, cur.y*scale, scale, scale);	
    }	
    iterate();
}


void keyPressed() {

    switch(key) {
    case '0': //random inital
	background(0);
	init_random();
	break;
    case '1': //single inital
	background(0);
	init_center();
	break;
    case 'f': // slow
	frameRate(2);
	break;
    case 'F': // fast
	frameRate(25);
	break;
    case 'a': //"age"
	opacity = 255;
	break;
    case 'A': //"age"
	opacity = 100;
	break;
    case 's': // small fast step
	for(int i = 0; i < 1000; i++) iterate();
	break;
    case 'S': // larger fast step
	for(int i = 0; i < 10000; i++) iterate();
	break;
    case 'r' : //rule
	setRule(rule - 1);
	println(" rule is now "  + rule);
	break;
    case 'R' : //rule
	setRule(rule + 1);
	break;
    case 'n' ://hilbert n
	n--; init_center() ; break;
    case 'N' ://hilbert n
	n++; init_center() ; break;
    case 'p' :// preset index
	pidx++; pidx%=presets.length;
	setRule(presets[pidx]);
	break;
    case 't': //tilfældig
	setRule(1+ (int)random(255));
    }
}

void init_random() {
    cnt = 1<<n * 1 <<n;
    states = new int[cnt];
    for(int i = 0; i < cnt; i++) {
	states[i] = random(1.0) < .5 ? 0 : 1;
    }
    println("getting ready for hilbert(" + n +") and " + cnt + " segments");
}

void init_center() {
    cnt = 1<<n * 1 <<n;
    states = new int[cnt];
    for(int i = 0; i < cnt; i++) {
	states[i] = 0;
    }
    states[states.length/2] = 1;
    println("getting ready for hilbert(" + n +") and " + cnt + " segments");
}

void setRule(int r) {
    rule = r;
    println(" rule is now "  + rule);
}

void reset() {
    smooth();
    colorMode(HSB);
}

void mouseClicked() {
    reset();
    iterate();
    loop();
}


