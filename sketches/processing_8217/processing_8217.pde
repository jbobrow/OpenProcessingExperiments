
class Int {
	Int(int _val) {val = _val;}
	int val;
}

class LSystem  {
	int steps = 0;

	String axiom;
	String ruleA;
	String ruleF;
	String ruleS;
	String ruleL;
	String production;

	float startLength;
	float drawLength;
	float theta;

	int generations;

	LSystem() {
		axiom = "A";
		ruleA = "[&FL!A]/////[&FL!A]///////[&FL!A]";
		ruleF = "S/////F";
		ruleS = "FL";
		ruleL = "[^^f]";
		startLength = 2.0;
		theta = radians(22.5);
		init();
	}

	void init() {
		production = axiom;
		drawLength = startLength;
		generations = 0;
	}

	void reset() {
		steps = 0;
	}

	int getAge() {
		return generations;
	}

	void render() {
		int diameter = 7;
		ArrayList diameterStack = new ArrayList();
		steps += 100;          
		if (steps > production.length()) {
			steps = production.length();
		}
		for (int i = 0; i < steps; i++) {
			char step = production.charAt(i);
			if (step == 'F') {
				noStroke();
				fill(153,76,0);
				translate(0, -drawLength/2, 0);
				box(diameter*0.1, drawLength, diameter*0.1);
				translate(0, drawLength/2, 0);
				translate(0, -drawLength, 0);
			}
			else if (step == 'f') {
				drawLeaf();
			}
			else if (step == '+') {
				rotateZ(theta);
			}
			else if (step == '-') {
				rotateZ(-theta);
			}
			else if (step == '&') {
				rotateX(theta);
			}
			else if (step == '^') {
				rotateX(-theta);
			}
			else if (step == '\\') {
				rotateY(theta);
			}
			else if (step == '/') {
				rotateY(-theta);
			}
			else if (step == '|') {
				rotateZ(radians(-180));
			}
			else if (step == '[') {
				pushMatrix();
				diameterStack.add(new Int(diameter));
			} 
			else if (step == ']') {
				popMatrix();
				diameter = ((Int)(diameterStack.get(diameterStack.size()-1))).val;
				diameterStack.remove(diameterStack.size()-1);
			}
			else if (step == '!') {
				diameter--;
			}
			else if (step == '{') {
			}
		}
	}

	void simulate(int gen) {
		while (getAge() < gen) {
			production = iterate(production);
		}
	}

	String iterate(String prod_) {
		generations++;
		String newProduction = new String();
		for (int i = 0; i < prod_.length(); i++) {
			switch (prod_.charAt(i)) {
				case 'A':
					newProduction += ruleA;
					break;
				case 'F':
					newProduction += ruleF;
					break;
				case 'S':
					newProduction += ruleS;
					break;
				case 'L':
					newProduction += ruleL;
					break;
				default:
					newProduction += prod_.charAt(i);
			}
		}
		return newProduction;
	}

	void drawLeaf()
	{
		noStroke();
		fill(0,255,0);
		beginShape();
		vertex(0,0,0);
		vertex(-0.7653669,-1.847759,0);
		vertex(-0.7653669,-3.847759,0);
		vertex(0,-5.695518,0);
		vertex(0.7653669,-3.847759,0);
		vertex(0.7653669,-1.847759,0);
		endShape();
	}
}


