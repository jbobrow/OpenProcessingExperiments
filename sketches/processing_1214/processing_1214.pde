
class Monster
{
	public PVector pos;
	public PVector vel;
	public PVector acc;
	
	public float dancePeriod;
	public float danceAmpX;
	public float danceAmpY;
	public float nextPeriod;
	
	float neighborDancePeriod = 0;
	
	public int moodColor;
	
	public ArrayList nodes;
	
	float bodyOffsetX = random(-0.2 * width / col, 0.2 * width / col);
	float bodyOffsetY = random(-0.2 * height / row, 0.2 * height / row);
	float headHeight = random(5,30);
	float headWidth = random(30,width / col);
	float bodyWidth = random(30,width / col * 0.8);
	float bodyLength = random(20,height / row - 5 - headHeight);	
	float feetSpacing = random(0,1);
	float bodyDent = random(0,10);
	float bodyTightness = random(-2.5,-1);
	float eyeDistance = random(0.3,0.8) * headWidth;
	float eyeRadius = random(6,eyeDistance / 2);
	float eyeShift = random(-2, headHeight * 0.6);
	float pupilOffset = random(-eyeRadius * 0.6, eyeRadius * 0.6);
	float pupilRadius = random(1, eyeRadius * 0.5);
	int eyeType;
	
	
	PVector vecHead;
	PVector vecLeftEar;
	PVector vecRightEar;
	PVector vecLeftFoot;
	PVector vecRightFoot;
	PVector vecBottom;
	PVector vecEyeCenter;
	
	
	PVector base_vecHead;
	PVector base_vecLeftEar;
	PVector base_vecRightEar; 
	PVector base_vecLeftFoot;
	PVector base_vecRightFoot;
	PVector base_vecBottom;	
	PVector base_vecEyeCenter;
	
	float base_danceAmpX;
	float base_danceAmpY;
	
	boolean hovering = false;
	
	Monster(PVector initPos)
	{
		this.pos = initPos;
		this.nodes = new ArrayList();
		
		dancePeriod = int(random(10,60));
		nextPeriod = dancePeriod;
		danceAmpX = int(random(1,20));
		danceAmpY = int(random(0,30));
				
		vecHead = new PVector(0, - headHeight - bodyLength);		
		vecLeftEar = new PVector(-0.5 * headWidth,  - bodyLength);
		vecRightEar = new PVector(0.5 * headWidth,  - bodyLength);		
		vecLeftFoot = new PVector(-0.5 * bodyWidth, 0);
		vecRightFoot = new PVector(0.5 * bodyWidth, 0);		
		vecBottom = new PVector(0, 0);	
		vecEyeCenter = new PVector(0,0);
		
		base_vecHead = vecHead.get();	
		base_vecLeftEar = vecLeftEar.get();
		base_vecRightEar = vecRightEar.get();
		base_vecLeftFoot = vecLeftFoot.get();
		base_vecRightFoot = vecRightFoot.get();	
		base_vecBottom = vecBottom.get();
		base_vecEyeCenter = vecEyeCenter.get();
		
		base_danceAmpX = danceAmpX;
		base_danceAmpY = danceAmpY;
				
		moodColor = int(random(50,150));
		eyeType = int(random(0,5));
	} 
	
	
	void look(int myRow, int myCol)
	{
		//Monster[] neighbors = new Monster[8];
		
		int averagePeriod = 0;
		int averageAmpX = 0;
		int averageAmpY = 0;
		int count = 0;
		
		for (int i = -1; i <= 1 ; i++)
		{
			for (int j = -1; j <= 1 ; j++)
			{
				if (i != 0 || j != 0)
				{
					//is neighbor
					int rowIndex = myRow + i;
					int colIndex = myCol + j;
					
					if (rowIndex < 0)
					{
						rowIndex = rowIndex + row;
					}
					else if (rowIndex >= row)
					{
						rowIndex = rowIndex - row;
					}
					
					if (colIndex < 0)
					{
						colIndex = colIndex + col;
					}
					else if (colIndex >= col)
					{
						colIndex = colIndex - col;
					}
					//println(rowIndex + ", " + colIndex + " GET: " + (rowIndex * col + colIndex));
					Monster neighborMon = monsters[rowIndex][colIndex];
					
					
					averagePeriod += neighborMon.dancePeriod;
					averageAmpX += neighborMon.danceAmpX;
					averageAmpY += neighborMon.danceAmpY;
					//println(averagePeriod+","+averageAmpX+","+averageAmpY);
					count++;
					//println(count);
				}
			}
			
		}

		averagePeriod = int(float(averagePeriod) / count);
		averageAmpX = int(float(averageAmpX) / count);
		averageAmpY = int(float(averageAmpY) / count);
		//println("----------------");
		//println(averagePeriod+","+averageAmpX+","+averageAmpY);
		neighborDancePeriod = averagePeriod;

		float fac = 0.12;

		/*
		if ((averagePeriod - this.nextPeriod) < 0) //i am slower
		{
			this.nextPeriod += (averagePeriod - this.nextPeriod) * fac;
		}
		else
		{
			this.nextPeriod += (averagePeriod - this.nextPeriod) * fac;
		}
		*/
		
		this.nextPeriod += min((averagePeriod - this.nextPeriod) * fac, this.dancePeriod * 0.15);

		//this.danceAmpX += (averageAmpX - this.danceAmpX) * fac;
		//this.danceAmpY += (averageAmpY - this.danceAmpY) * fac;
		
		
		nextPeriod = min(max(nextPeriod,15),100);
		//println("new period: " + dancePeriod);
	}
	
	void update()
	{
		int step = frameCount % int(dancePeriod);
		
		float position = float(step) / dancePeriod;
		
		if (abs(position - 0.5) < 0.05 && int(nextPeriod) != int(dancePeriod))
		{
			dancePeriod = nextPeriod;
		}
		
		position = map(position,0,1,0,TWO_PI);
		
		PVector danceOffset = new PVector(sin(position) * danceAmpX,  -1 * abs(sin(position) * danceAmpY));
		
		vecHead = PVector.add(base_vecHead, danceOffset);
		vecLeftEar = PVector.add(base_vecLeftEar, danceOffset);
		vecRightEar = PVector.add(base_vecRightEar, danceOffset);	
		//vecLeftFoot = PVector.add(base_vecLeftFoot, danceOffset);
		//vecRightFoot = PVector.add(base_vecRightFoot, danceOffset);
		//vecBottom = PVector.add(base_vecBottom, danceOffset);
		vecEyeCenter = PVector.add(base_vecEyeCenter, PVector.mult(danceOffset,1.4));
		
		//println(position + "/" + dancePeriod + ":" + danceOffset.x + "," + danceOffset.y);
	}
	
	void show() 
	{
		pushMatrix();
		translate(pos.x + bodyOffsetX, pos.y + bodyOffsetY);
		
		
		//body
		stroke(40);
		if (hovering)
		{
			fill(moodColor);
		}
		else
		{
			fill(moodColor,190);
		}
		
		
		curveTightness(bodyTightness);
		
		beginShape();
		curveVertex(vecBottom.x,		vecBottom.y - bodyDent);
		curveVertex(vecBottom.x - feetSpacing,		vecBottom.y);
		curveVertex(vecLeftFoot.x,	vecLeftFoot.y);
		curveVertex(vecLeftEar.x,		vecLeftEar.y);
		curveVertex(vecHead.x,			vecHead.y);
		curveVertex(vecRightEar.x,	vecRightEar.y);
		curveVertex(vecRightFoot.x,	vecRightFoot.y);
		curveVertex(vecBottom.x + feetSpacing,		vecBottom.y);
		curveVertex(vecBottom.x,		vecBottom.y - bodyDent);
		endShape(CLOSE);
		
		if (debugging)
		{
			if (dancePeriod > neighborDancePeriod) //slower
			{	fill(255,0,0);}
			else
			{
				fill(0,0,255);
			}
			text(round(this.dancePeriod) + "/" + round(this.neighborDancePeriod), vecBottom.x, vecBottom.y - 40);
		}
		
		//draw eye
		translate(vecEyeCenter.x, vecEyeCenter.y);
		
		fill(255);
		ellipse(-0.5 * eyeDistance, - bodyLength - eyeShift, eyeRadius, eyeRadius);
		ellipse(0.5 * eyeDistance, - bodyLength - eyeShift, eyeRadius, eyeRadius);
		
		stroke(moodColor - 30);
		noFill();
		
		switch (eyeType)
		{
			case 1:
				line(-0.5 * eyeDistance - eyeRadius * 0.5, - bodyLength - eyeShift + 2,  -0.5 * eyeDistance + eyeRadius * 0.5, - bodyLength - eyeShift - 2);
				line(0.5 * eyeDistance - eyeRadius * 0.5, - bodyLength - eyeShift - 2,  0.5 * eyeDistance + eyeRadius * 0.5, - bodyLength - eyeShift + 2);
			
				break;
			case 2:
				line(-0.5 * eyeDistance - eyeRadius * 0.5, - bodyLength - eyeShift - 2,  -0.5 * eyeDistance + eyeRadius * 0.5, - bodyLength - eyeShift + 2);
				line(0.5 * eyeDistance - eyeRadius * 0.5, - bodyLength - eyeShift + 2,  0.5 * eyeDistance + eyeRadius * 0.5, - bodyLength - eyeShift - 2);
				break;
			case 3:
				fill(moodColor + 20);
				noStroke();
				ellipse(-0.5 * eyeDistance + pupilOffset, - bodyLength - eyeShift, pupilRadius, pupilRadius);
				ellipse(0.5 * eyeDistance + pupilOffset, - bodyLength - eyeShift, pupilRadius, pupilRadius);
				break;
			case 0:
			default:
				line(-0.5 * eyeDistance - eyeRadius * 0.6, - bodyLength - eyeShift,  -0.5 * eyeDistance + eyeRadius * 0.6, - bodyLength - eyeShift);
				line(0.5 * eyeDistance - eyeRadius * 0.6, - bodyLength - eyeShift,  0.5 * eyeDistance + eyeRadius * 0.6, - bodyLength - eyeShift);
				break;
		}
		
		
		
		popMatrix();
	}
	
	void mouseMoved()
	{
		if (abs(mouseX - this.pos.x) <= width / col && (mouseY <= this.pos.y + 10 && mouseY >= this.pos.y + 10 - height / row) )
		{
			hovering = true;
			nextPeriod += 5;
			danceAmpX = min(base_danceAmpX * 1.2,30);
			danceAmpY = min(base_danceAmpY * 1.2,45);
		}
		else
		{
			hovering = false;
			danceAmpX = base_danceAmpX;
			danceAmpY = base_danceAmpY;
		}
	}

}

