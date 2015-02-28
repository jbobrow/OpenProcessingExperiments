
        int width = 850;
	int height = width;
	int ellipseRadius = 50;
	int count = 0;
	int lineStop = 100;
	int backgroundColor = 0;
	int fillColor = 255;
	int pointDistance = 50;
	boolean moveForward = true;
	int speed = 3;
	int pointOffset = 0;

	public void setup() {
		size(850, 850);
		background(0);
		smooth();
	}

	public void draw() {
		background(backgroundColor);
		strokeWeight(7);
		fill(fillColor);
		ellipse(width / 2, height / 2, ellipseRadius, ellipseRadius);
		stroke(fillColor);

		for (int x = 0; x <= width; x = x + width / 2) {
			for (int y = 0; y <= height; y = y + height / 2) {
				int xEnd = x;
				int yEnd = y;
				if (x == 0) {
					xEnd = x + count;
				}
				if (x == width / 2) {
					xEnd = x;
				}
				if (x == width) {
					xEnd = x - count;
				}
				if (yEnd == 0) {
					yEnd = yEnd + count;
				}
				if (yEnd == height / 2) {
					yEnd = yEnd;
				}
				if (yEnd == height) {
					yEnd = yEnd - count;
				}
				line(x, y, xEnd, yEnd);
			}
		}

		if (count <= (width / 2) - lineStop && moveForward) {
			count++;
		} else {
			backgroundColor = 255;
			fillColor = 0;
			if (count % pointDistance/2 == 0) {
				pointOffset = pointOffset + pointDistance;
			}
				for (int x = width / 2 - (pointDistance+pointOffset); x <= width / 2
						+ pointDistance+pointOffset; x = x + pointDistance) {
					for (int y = height / 2 - (pointDistance+pointOffset); y <= height / 2
							+ pointDistance+pointOffset; y = y + pointDistance) {
						if (x == width / 2 || y == height / 2) {
							ellipse(x, y, ellipseRadius / 2, ellipseRadius / 2);
						} else {
							ellipse(x, y, ellipseRadius, ellipseRadius);
						}
					}
				}
				
			if (count > 40) {
				double tmp = (double) (width/2) * (0.3);
				if (count > tmp) {
					count = count - speed * 3;
				} else {
					count = count - speed;
				}
			}
			moveForward = false;
		}
	}


