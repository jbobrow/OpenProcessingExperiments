
class QLearner {
	final int UP = 0;
	final int RIGHT = 1;
	final int DOWN = 2;
	final int LEFT = 3;
	final int NUM_ACTIONS = 4;
	
	int STATESIZE_X = 10; // virtual, ie just for visualization
	int STATESIZE_Y = 10; // ""
	int STATESIZE = STATESIZE_X * STATESIZE_Y;
	
	float theta = (float)0.8;
	float gamma = (float).8;
	
	//ArrayList<Integer> rewardStates = new ArrayList<Integer>();
	boolean stateActionIsAvailable[][] = new boolean[STATESIZE][NUM_ACTIONS];
	
	float R[] = new float[STATESIZE];
	float Q[][] = new float[STATESIZE][NUM_ACTIONS];
	
	Random r = new Random();
	
	public QLearner(int x, int y) {
		STATESIZE_X = x;
		STATESIZE_Y = y;
		STATESIZE = x*y;
		init();
	}
	
	String actionToString(int action) {
		switch(action){
		case UP:
			return "UP";
		case RIGHT:
			return "RIGHT";
		case DOWN:
			return "DOWN";
		case LEFT:
			return "LEFT";
		}
		return "";
	}
	
        int getStateSizeX() {return STATESIZE_X;}
        int getStateSizeY() {return STATESIZE_Y;}
        
        float[] getActionQ(int state) {
          return Q[state];
        }
        
	int[] singleToGrid(int state) {
		int n[] = new int[2];
		n[0] = state%STATESIZE_X;
		n[1] = state/STATESIZE_X;
		return n;
	}
	
	void printStateMap(int state) {
		int xPos = singleToGrid(state)[0];
		int yPos = singleToGrid(state)[1];
		
		for(int y=0; y<STATESIZE_Y; y++) {
			for(int x=0; x<STATESIZE_X;x++) {
				if(xPos == x && yPos == y) print("√ ");
				else print("X ");
			}
			println();
		}
	}
	
	float round2(float n) {
		float result = n*10;
		result = Math.round(result);
		result /= 10;
		return result;
	}
	
	void printActionAvailability() {
		for(int y=0; y<STATESIZE_Y; y++) {
			for(int x=0; x<STATESIZE_X;x++) {
				for(int i=0; i<NUM_ACTIONS; i++) {
					if(stateActionIsAvailable[gridToSingle(x,y)][i]) {
						print("/");
					}
					else {
						print("x");
					}
				}
				print(" ");
			}
			println();
		}
	}
 	void printQValues() {
		for(int y=0; y<STATESIZE_Y; y++) {
			for(int x=0; x<STATESIZE_X;x++) {
				for(int i=0; i<NUM_ACTIONS; i++) {
					float q = getQ(gridToSingle(x,y),i);
					print(round2(q) + " ");
				}
				print("   ");
			}
			println();
		}
	}
	void printRewardValues() {
		for(int y=0; y<STATESIZE_Y; y++) {
			for(int x=0; x<STATESIZE_X;x++) {
				print(getReward(gridToSingle(x,y)) + " ");
			}
			println();
		}
	}
	
	void setEdgesAsNullActions() {
		for(int i=0; i<STATESIZE;i++) {
			stateActionIsAvailable[i][0] = true;
			stateActionIsAvailable[i][1] = true;
			stateActionIsAvailable[i][2] = true;
			stateActionIsAvailable[i][3] = true;
		}
		
		// set vertical edges
		for(int i=0; i<STATESIZE_Y;i++) {
			stateActionIsAvailable[gridToSingle(0,i)][LEFT] = false;
			stateActionIsAvailable[gridToSingle(STATESIZE_X-1,i)][RIGHT] = false;
		}
		// set horizontal edges
		for(int i=0; i<STATESIZE_X;i++) {
			stateActionIsAvailable[gridToSingle(i,0)][UP] = false;
			stateActionIsAvailable[gridToSingle(i,STATESIZE_Y-1)][DOWN] = false;
		}
	}
	
	void setQRandom() {
		Random r = new Random();
		for(int i=0; i<STATESIZE; i++) {
			for(int j=0; j<NUM_ACTIONS; j++) {
				Q[i][j] = r.nextFloat();
			}
		}
	}
	
	void init() {
		// set stateActionIsAvailable	
		println("Initializing Q");
		setEdgesAsNullActions();
		//setReward(gridTo,1);
	}
	
	int gridToSingle(int x, int y) {
		return y*STATESIZE_X+x;
	}
	
	void setReward(int state, float value) {
		R[state] = value;
	}
	float getReward(int state) {
		// if state is within reward states
		return R[state];
	}
		
	float getQ(int state, int action) {
		return Q[state][action];
	}
	void setQ(int state, int action, float value) {
		Q[state][action] = value;
	}
	void setQ(int x, int y, int action, float value) {
		Q[gridToSingle(x,y)][action] = value;
	}
	
	int transition(int state, int action) {
		if(action == UP) return state-STATESIZE_X;
		if(action == RIGHT) return state+1;
		if(action == DOWN) return state+STATESIZE_X;
		if(action == LEFT) return state-1;
		return 0;
	}

	void updateQ(int lastState, int actionUsed, int newState) {
		float oldQ = Q[lastState][actionUsed];
		//println(newState);
		int maxAction = getMaxQAction(newState);
		Q[lastState][actionUsed] = oldQ + theta*(R[newState] + gamma*Q[newState][maxAction] - oldQ);
		//println(oldQ + "+" + theta + "*(" +R[newState] + "+" + gamma + "*" + Q[newState][maxAction] + "-"+ oldQ +") =");
		//println(Q[lastState][actionUsed]);
	}
	
	int firstAvailableAction(int state) {
		for(int i=0; i<NUM_ACTIONS; i++) {
			if(stateActionIsAvailable[state][i]) return i;
		}
		return -1;
	}
	
	int randomAvailableAction(int state) {
		int bestAction = r.nextInt(4);
		while(!stateActionIsAvailable[state][bestAction]) {
			bestAction = r.nextInt(4);
		}
		return bestAction;
	}
	
	int getMaxQAction(int state) {
		//println(state);
		float maxQ = 0;
		int bestAction = firstAvailableAction(state);		
		for(int i=0; i<NUM_ACTIONS; i++) { // go through all the actions
			if(stateActionIsAvailable[state][i]) { // if the action is available
				if(maxQ<Q[state][i]) { // check if its greater than the current maxQ
					maxQ = Q[state][i]; // if it is then set maxQ to it
					bestAction = i; // and set bestAction to the current action
				}	
			}
		}
		return bestAction;
	}
}

