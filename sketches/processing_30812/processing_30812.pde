
	// Rendering options
	static boolean DRAW_SEGMENTS = true;
	static boolean DRAW_JOINTS = false;
	static boolean DRAW_TARGET_VECTS = false;
	static boolean DRAW_EFFECTOR_VECTS = false;
	static boolean DRAW_HELP_TEXT = false;
	// Other state
	boolean mMouseOver;
	boolean mDrawEnabled;
	static boolean mNoiseEnabled = true;
	// Instructions
	static final String mInstructions1 = 
                "Show / hide this help : click";
	static final String mInstructions2 = 
		"Number of segments    : [1-9]\n"+
		"Toggle Perlin noise   : [q]\n" +
		"Draw segments         : [w]\n"+
		"Draw joints           : [e]\n"+
		"Draw target vectors   : [r]\n"+
		"Draw effector vectors : [t]\n"+
		"Add tentacle          : [ctrl] + left click\n"+
		"Clear tentacles       : [ctrl] + right click\n";
	// Tentacles
	static final int mTentacleCount = 4;
	static int mTentacleSegmentLength = 6;
	ArrayList<Tentacle> mTentacles = new ArrayList<Tentacle>();

	/* DRAWING */
	@Override
	public void setup() {
		size(600, 250);
		//
		PFont font = loadFont("DroidSansMono-10.vlw");
		textFont(font);
		textLeading(10);
		//
		smooth();
		strokeWeight(0.5f);
		noLoop();
		//
		addTentacles((int) (width * 0.9f), height, (int) (width * 0.9f), mTentacleSegmentLength, mTentacleCount);
	}

	@Override
	public void draw() {
		background(240);
		if (mDrawEnabled) {
			//
			for (Tentacle t : mTentacles) {
				t.update();
				//
				if (DRAW_EFFECTOR_VECTS) {
					stroke(0, 0, 255);
					for (Segment l : t.mSegments) {
						l.drawEffectorVectors();
					}
				}
				if (DRAW_TARGET_VECTS) {
					stroke(255, 0, 0);
					for (Segment l : t.mSegments) {
						l.drawTargetVectors();
					}
				}
				stroke(153);
				if (DRAW_SEGMENTS) {
					for (Segment l : t.mSegments) {
						l.drawLimb();
					}
				}
				if (DRAW_JOINTS) {
					for (Segment l : t.mSegments) {
						l.drawJoint();
					}
				}
			}
			if (keyPressed || DRAW_HELP_TEXT) {
				fill(255, 0, 0);
				text(mInstructions1, 5, 10);
				fill(55);
				text(mInstructions2, 5, 20);
				fill(255);
			}
		}
	}

	/* KEYBOARD INPUT */
	@Override
	public void keyPressed() {
		switch (key) {
			case 'q':
			case 'Q':
				mNoiseEnabled ^= true;
				break;
			case 'w':
			case 'W':
				DRAW_SEGMENTS ^= true;
				break;
			case 'e':
			case 'E':
				DRAW_JOINTS ^= true;
				break;
			case 'r':
			case 'R':
				DRAW_EFFECTOR_VECTS ^= true;
				break;
			case 't':
			case 'T':
				DRAW_TARGET_VECTS ^= true;
				break;
		}
		if (keyCode == 32) {
			DRAW_HELP_TEXT ^= true;
		}
		// Numbers 1-9
		if (keyCode >= 49 && keyCode <= 57) {
			// Map to (n^2)+5
			mTentacleSegmentLength = keyCode - 48;
			mTentacleSegmentLength *= mTentacleSegmentLength;
			mTentacleSegmentLength += 5;
			mTentacles.clear();
			addTentacles((int) (width * 0.9f), height, (int) (width * 0.9f), mTentacleSegmentLength, mTentacleCount);
		}
	}

	/* MOUSE INPUT */
	@Override
	public void mouseEntered(MouseEvent arg0) {
		mMouseOver = true;
		mDrawEnabled = true;
		loop();
	}

	@Override
	public void mouseExited(MouseEvent arg0) {
		mMouseOver = false;
	}

	@Override
	public void mousePressed() {
		if (keyPressed && key == CODED && keyCode == CONTROL) {
			if (mouseButton == LEFT) {
				// add a new patch of tentacles
				addTentacles(mouseX, mouseY, (int) (width * 0.9f), mTentacleSegmentLength, mTentacleCount);
				mTentacles.add(new Tentacle(mouseX, mouseY, (int) (width * 0.66f), mTentacleSegmentLength));
			} else {
				mTentacles.clear();
			}
		} else {
			DRAW_HELP_TEXT ^= true;
		}
	}

	/* DATA */
	public void addTentacles(int xOrigin, int yOrigin, int length, int segmentLength, int count) {
		for (int i = 0; i < count; i++) {
			mTentacles.add(new Tentacle(xOrigin, yOrigin, length, segmentLength));
		}
	}

	class Tentacle {

		Segment[] mSegments;

		/**
		 * Create a new Tentacle.
		 * <p>
		 * By default, the tentacle is laid out right-to-left, horizontally, with a segment length of 5px.
		 * </p>
		 * 
		 * @param xOrigin
		 * @param yOrigin
		 * @param length
		 *            Tentacle length in pixels
		 * @param segmentLength
		 *            Segment length in pixels
		 */
		public Tentacle(float xOrigin, float yOrigin, int length, int segmentLength) {
			PVector startPoint = new PVector(xOrigin, yOrigin);
			mSegments = new Segment[length / segmentLength];
			for (int i = 0; i < mSegments.length; i++) {
				PVector endPoint = new PVector(xOrigin - (segmentLength * (i + 1)), yOrigin);
				mSegments[i] = new Segment(startPoint, endPoint);
				startPoint = endPoint;
			}
		}

		PVector targetPos = new PVector();
		PVector effectorPos;
		PVector jointPos;

		public void update() {
			// Set target position
			if (mMouseOver) {
				targetPos.set(mouseX, mouseY, 0);
			} else {
				targetPos.set(0, height + 2, 0);
			}
			// Work along the tentacle from the tip, adjusting each segment to minimise the angle between the target and
			// effector vectors
			for (int i = mSegments.length - 1; i >= 0; i--) {
				Segment seg = mSegments[i];
				jointPos = seg.jointPos;
				effectorPos = mSegments[mSegments.length - 1].endPos;
				// Calculate vectors for this segment
				seg.effectorVector = PVector.sub(effectorPos, jointPos);
				seg.targetVector = PVector.sub(targetPos, jointPos);
				// Add Perlin noise to y component, makes tentacle tentative...
				if (mNoiseEnabled && mMouseOver) {
					float noise = noise(millis() * 0.001f);
					seg.effectorVector.y *= noise;
				}
				// if (seg.effectorVector.y != seg.effectorVector.y) println("ugh");
				// Normalise and find the angle between the vectors
				seg.effectorVector.normalize();
				seg.targetVector.normalize();
				float turnAngle = PVector.dot(seg.targetVector, seg.effectorVector);
				// Have to constrain due to rounding error causing NaN
				if (turnAngle > 1) turnAngle = 1;
				turnAngle = acos(turnAngle);
				// Find direction to turn from the cross-product polarity
				PVector crossResult = seg.targetVector.cross(seg.effectorVector);
				// Finally, rotate the segments around their joints. Is 0.5*n(n+1)complexity, as turning a joint near
				// the base affects a large number of dependent joints. There's probably a better way to do this, like
				// rotating the drawing matrix, but it'd require mixing the logic and drawing code.
				if (turnAngle > 0) {
					if (crossResult.z > 0f) turnAngle = -turnAngle;
					for (int j = i; j < mSegments.length; j++) {
						mSegments[j].rotateAboutPoint(mSegments[i].jointPos, 0.1f * turnAngle);
					}
				}
			}
		}
	}

	/**
	 * Each segment is essentially a stick on a pivot. They're created in a chain, like a linked-list, so their end
	 * position is the same object as the pivot of the next link.
	 */
	class Segment {

		PVector jointPos;
		PVector endPos;
		PVector effectorVector = new PVector();
		PVector targetVector = new PVector();

		public Segment(PVector startPosition, PVector endPosition) {
			jointPos = startPosition;
			endPos = endPosition;
		}

		/**
		 * Rotates the segment about the given point.
		 * <p>
		 * Useful when propagating rotation to segments higher up the tentacle - e.g. rotating segments 4-10 around the
		 * pivot of segment 3. Some rounding error going on here though, at other rotate implementations cause the
		 * tentacle to gradually shorten.
		 * </p>
		 * 
		 * @param point
		 * @param radians
		 */
		public void rotateAboutPoint(PVector point, float radians) {
			PVector v = PVector.sub(endPos, point);
			//
			float xTemp = v.x;
			v.x = v.x * cos(radians) - v.y * sin(radians);
			v.y = xTemp * sin(radians) + v.y * cos(radians);
			//
			v.add(point);
			endPos.set(v);
		}

		public void drawLimb() {
			line(jointPos.x, jointPos.y, endPos.x, endPos.y);
		}

		public void drawJoint() {
			ellipse(jointPos.x, jointPos.y, 5, 5);
		}

		public void drawTargetVectors() {
			line(jointPos.x, jointPos.y, jointPos.x + targetVector.x * 50, jointPos.y + targetVector.y * 50);
		}

		public void drawEffectorVectors() {
			line(jointPos.x, jointPos.y, jointPos.x + effectorVector.x * 50, jointPos.y + effectorVector.y * 50);
		}
	}


