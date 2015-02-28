

import java.awt.event.MouseWheelEvent;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;

import processing.core.*;

	public PImage jellyImg;
	public PImage lightningJellyImg;
	public PImage bigJellyImg;
	public PImage splittingJellyImg;
	public PImage FullGhostImg;
	public PImage armoredJellyImg;
	public PImage lava;
	public PImage spikes;
	public PImage mine;
	public PImage slow;
	public PImage fireJelly;
	public PImage earthJelly;
	public PImage waterJelly;
	public PImage airJelly;
	public PImage crawlingHand;
	public PImage jungleWyrm;
	public PImage wildyWyrm;
	public PImage iceWyrm;
	public PImage airWyrm;
	public PFont title;
	public PFont label;
	public PFont reg;
	public TerrainMap map = new TerrainMap(20, 20, 40, this);
	public SelectionPane sPane;
	public ArrayList<Mob> mobs = new ArrayList<Mob>();
	public ArrayList<Shootable> shots = new ArrayList<Shootable>();
	public ArrayList<NumberDisplay> numbers = new ArrayList<NumberDisplay>();
	public ArrayList<Wave> waves = new ArrayList<Wave>();
	public int selectionType = 0;
	public float scale = 1;
	public int rate = 99;
	public int wave = 0;
	public int dragX = 700;
	public int dragY = 0;
	public int waveSpawnDelay = 10;
	public int waveDelay = 0;
	public boolean spawning = false;
	public boolean towerSelected = false;
	public boolean levelInitiate = false;
	public boolean mainScreen = true;
	public boolean targeting = false;
	public boolean targetWarning = false;
	public boolean drag = false;
	public boolean elementSelection = false;
	public boolean continuousOption = false;
	public FiringTower selected;
	public int money = 300;
	public int health = 20;
	public int[] cost = { 100, 250, 150, 450, 300, 1000, 500, 500, 2000 };
	public int[] trapcost = { 1000, 200, 50, 200 };
	public int[] range = { 2, 4, 4, 3, 5, 9, 4, 4, 100 };
	public Class<?>[] types = { SingleTargetTower.class, SplashTower.class,
			FreezeTower.class, MachineGunTower.class, SlowTower.class,
			LaserTower.class, CannonTower.class, ElectricTower.class,
			BombardmentTower.class };
	PImage area;

	public void setup() {
		size(800, 800);
		jellyImg = this.loadImage("Jelly.png");
		lightningJellyImg = this.loadImage("LightningJelly.png");
		bigJellyImg = this.loadImage("BigJelly.png");
		splittingJellyImg = this.loadImage("SplittingJelly.png");
		FullGhostImg = this.loadImage("FullGhostKnight.png");
		armoredJellyImg = this.loadImage("ArmoredJelly.png");
		fireJelly = this.loadImage("FireJelly.png");
		waterJelly = this.loadImage("WaterJelly.png");
		earthJelly = this.loadImage("EarthJelly.png");
		airJelly = this.loadImage("AirJelly.png");
		crawlingHand = this.loadImage("CrawlingHand.png");
		jungleWyrm = this.loadImage("JungleStrykewyrm.png");
		wildyWyrm = this.loadImage("WildyStrykewyrm.png");
		iceWyrm = this.loadImage("IceStrykewyrm.png");
		airWyrm = this.loadImage("AirStrykewyrm.png");
		mine = this.loadImage("mine.png");
		lava = this.loadImage("lava.png");
		spikes = this.loadImage("spikes.png");
		slow = this.loadImage("sticky.png");
		scale = 0.84F;
		area = loadImage("mapVer1.png");
		sPane = new SelectionPane(0,800,100, types,range);
		title = createFont("Arial",60);
		label = createFont("Arial",20);
		reg = createFont("Arial",12);
		map.generate("map1.grid", 128, 64, 0, 0, 255, 0);
		loadWaves("level4.w");
		mobs = new ArrayList<Mob>();
	}

	public void draw() {
		if (mainScreen){
			background(0);
			map.paint(this);
			textFont(title);
			for (int i = 0; i < mobs.size(); i++) {
				mobs.get(i).process();
				mobs.get(i).paint(this);
				if (mobs.get(i).reachEnd) {
					mobs.get(i).isDead = true;
					mobs.remove(i);
					i--;
				}
			}
			if (waveDelay <= 0){
				spawning = true;
				waveDelay = 100;
			} else {
				if (spawning == false){
					waveDelay--;
				}
			}
			if (spawning) {
				if (waveSpawnDelay > 0) {
					waveSpawnDelay-= GlobalModifiers.multiplier;
				} else {
					spawnWave();
					waveSpawnDelay += 10;
				}
			}
			if (wave + 1 > waves.size()){
				loadWaves("level4.w");
				wave = 0;
			}
			stroke(255,255,255,255);
			fill(255,255,255,255);
			text("Tower Defence",200,100);
			fill(255,255,255,125);
			rect(300,300,200,50);
			fill(255,255,255,255);
			textFont(label);
			text("Start",380,330);
			
		} else if (!levelInitiate) {
			textFont(reg);
			background(0);
			imageMode(CORNER);
			translate(-dragX, -dragY);
			image(area, 0, 0);
			//System.out.println(mouseX + " " + mouseY);
			checkHighlight();
			if (mousePressed) {
				drag = true;
			} else {
				drag = false;
			}
			if (drag) {
				dragX -= mouseX - pmouseX;
				dragY -= mouseY - pmouseY;
				if (dragX > 700) {
					dragX = 700;
				}
				if (dragX < 0) {
					dragX = 0;
				}
				if (dragY > 300) {
					dragY = 300;
				}
				if (dragY < 0) {
					dragY = 0;
				}
			}
		} else {
			background(0);
			this.scale((float) scale);

			map.paint(this);
			sPane.paint(this);
			double scaleX = mouseX / scale;
			double scaleY = mouseY / scale;
			if (towerSelected) {
				if (selected instanceof BombardmentTower) {
					this.rectMode(CORNER);
					this.fill(0, 255, 0, 125);
					this.stroke(0, 255, 0, 255);
					this.rect(805, 280, 80, 50);
					this.fill(0, 0, 0, 255);
					this.text("Target", 815, 310);
				}
				int x = selected.getLocation().getX();
				int y = selected.getLocation().getY();
				int range = selected.getRange();
				for (int i = 0; i < range * 2 + 1; i++) {
					for (int j = 0; j < range * 2 + 1; j++) {
						if (x - range + i >= 0 && y - range + j >= 0
								&& x - range + i < map.width
								&& y - range + j < map.height)
							map.getSquare(x - range + i, y - range + j)
									.lighten();
					}
				}
				GridSquare temp = new GridSquare(21, 9, 39);
				selected.paint(this, temp);
				this.fill(255, 255, 255, 255);
				this.text("Range: " + selected.getRange(), 805, 420);
				this.fill(255, 255, 255, 255);
				if (selected.elementLevel == 0) {
					this.text("Damage: " + selected.getDamage(), 805, 430);
				} else {
					this.text("Damage: " + selected.getDamage() + " + "
							+ selected.getDamage() * selected.elementLevel / 5,
							805, 430);
				}
				this.fill(255, 255, 255, 255);
				this.text("Firing Rate: " + selected.getFiringRate(), 805, 440);
				this.fill(255, 255, 255, 255);
				this.text(selected.specialText(), 805, 450);
				if (selected.upgradeRangeCost() != 0) {
					this.rectMode(CORNER);
					this.fill(0, 255, 0, 125);
					this.stroke(0, 255, 0, 255);
					this.rect(805, 480, 130, 50);
					this.fill(0, 0, 0, 255);
					this.text("Upgrade Range", 815, 500);
					this.text("Cost: " + selected.upgradeRangeCost(), 815, 515);
				}
				if (selected.upgradeDamageCost() != 0) {
					this.rectMode(CORNER);
					this.fill(0, 255, 0, 125);
					this.stroke(0, 255, 0, 255);
					this.rect(805, 540, 130, 50);
					this.fill(0, 0, 0, 255);
					this.text("Upgrade Damage", 815, 560);
					this.text("Cost: " + selected.upgradeDamageCost(), 815, 575);
				}
				if (selected.upgradeFiringRateCost() != 0) {
					this.rectMode(CORNER);
					this.fill(0, 255, 0, 125);
					this.stroke(0, 255, 0, 255);
					this.rect(805, 600, 130, 50);
					this.fill(0, 0, 0, 255);
					this.text("Upgrade Firing Rate", 815, 620);
					this.text("Cost: " + selected.upgradeFiringRateCost(), 815,635);
				}
				if (selected.upgradeSpecialCost() != 0) {
					this.rectMode(CORNER);
					this.fill(0, 255, 0, 125);
					this.stroke(0, 255, 0, 255);
					this.rect(805, 660, 130, 50);
					this.fill(0, 0, 0, 255);
					this.text(selected.upgradeMessage(), 815, 680);
					this.text("Cost: " + selected.upgradeSpecialCost(), 815,
							695);
					if (elementSelection == true && selected.elementLevel == 0) {
						for (int i = 1; i < 5; i++) {
							this.fill(0, 255, 0, 125);
							this.stroke(0, 255, 0, 255);
							String elementText = "";
							if (i == 1) {
								elementText = "Fire";
							} else if (i == 2) {
								elementText = "Water";
							} else if (i == 3) {
								elementText = "Earth";
							} else {
								elementText = "Air";
							}
							if (i >= 3) {
								this.rect(785 + (i - 2) * 40, 752, 38, 30);
								this.fill(255, 255, 255, 255);
								this.text(elementText, 787 + (i - 2) * 40, 767);

							} else {
								this.rect(785 + i * 40, 720, 38, 30);
								this.fill(255, 255, 255, 255);
								this.text(elementText, 787 + i * 40, 735);
							}

						}
					}
				}
			}

			if (scaleX < map.getWidth() * map.squareSize
					&& scaleY < map.getHeight() * map.squareSize && scaleX > 0
					&& scaleY > 0) {
				map.getSquare((double) scaleX, (double) scaleY).lighten();
				if (selectionType > 0){
					sPane.slots.get(new Integer(selectionType-1)).t.paint(this, map.getSquare((double) scaleX, (double) scaleY));
					int x = map.getSquare((double) scaleX, (double) scaleY).getX();
					int y = map.getSquare((double) scaleX, (double) scaleY).getY();
					int range = sPane.slots.get(new Integer(selectionType-1)).t.getRange() + map.getSquare((double) scaleX, (double) scaleY).height;
					for (int i = 0; i < range * 2 + 1; i++) {
						for (int j = 0; j < range * 2 + 1; j++) {
							if (x - range + i >= 0 && y - range + j >= 0
									&& x - range + i < map.width
									&& y - range + j < map.height)
								map.getSquare(x - range + i, y - range + j)
										.lighten();
						}
					}
				}
				if (targeting) {
					GridSquare target = map.getSquare((double) scaleX,
							(double) scaleY);
					this.stroke(255, 0, 0, 255);
					this.line(target.getX() * target.squareSize, target.getY()
							* target.squareSize, target.getX()
							* target.squareSize + target.squareSize,
							target.getY() * target.squareSize
									+ target.squareSize);
					this.line(target.getX() * target.squareSize, target.getY()
							* target.squareSize + target.squareSize,
							target.getX() * target.squareSize
									+ target.squareSize, target.getY()
									* target.squareSize);
				}
			}
			if (mousePressed) {
				if (scaleX > 805 && scaleX < 885 && scaleY > 00 && scaleY < 50) {
					spawning = true;
				}
			}
			map.process(this, map, shots);
			/*
			 * if (Math.random() * 100 > rate) { spawnMob(); }
			 */
			for (int i = 0; i < mobs.size(); i++) {
				mobs.get(i).process();
				mobs.get(i).paint(this);
				if (mobs.get(i).isDead) {
					NumberDisplay n = new NumberDisplay((int) mobs.get(i).x,
							(int) mobs.get(i).y, 255, mobs.get(i).coinValue);
					numbers.add(n);
					money += mobs.get(i).coinValue;
					mobs.remove(i);
					i--;
				} else if (mobs.get(i).reachEnd) {
					health--;
					mobs.get(i).isDead = true;
					mobs.remove(i);
					i--;
				}
			}
			for (int i = 0; i < shots.size(); i++) {
				shots.get(i).process();
				shots.get(i).paint(this);
				if (shots.get(i).getCollided()) {
					shots.remove(i);
					i--;
				}
			}
			for (int i = 0; i < numbers.size(); i++) {
				this.fill(255, 255, 0);
				this.text(numbers.get(i).getValue(), numbers.get(i).getX(),
						numbers.get(i).getY());
				numbers.get(i).incrementTimeAuto();
				if (numbers.get(i).getTime() < 0) {
					numbers.remove(i);
					i--;
				}

			}

			if (spawning) {
				if (waveSpawnDelay > 0) {
					waveSpawnDelay-= GlobalModifiers.multiplier;
				} else {
					spawnWave();
					waveSpawnDelay += 10;
				}
			}
			displayLevelGui();
			if (wave + 1 > waves.size() && mobs.size() == 0) {
				this.rectMode(CORNER);
				this.fill(0, 255, 0, 125);
				this.stroke(0, 255, 0, 255);
				this.rect(805, 180, 80, 50);
				this.fill(0, 0, 0, 255);
				this.text("Finish", 815, 210);
				if (mousePressed) {
					if (scaleX > 805 && scaleX < 885 && scaleY > 180
							&& scaleY < 230) {
						levelInitiate = false;
						wave = 0;
						continuousOption = false;
						GlobalModifiers.multiplier = 1;
						spawning = false;
						health = 20;
					}
				}
			}
			if (health <= 0) {
				levelInitiate = false;
				wave = 0;
				health = 20;
				selected = null;
				towerSelected = false;
				continuousOption = false;
				GlobalModifiers.multiplier = 1;
				spawning = false;
			}
			if(continuousOption){
				spawning = true;
			}
		}
	}

	public void displayLevelGui() {
		this.stroke(255, 255, 255, 255);
		this.fill(255, 255, 255, 255);
		int textOffset = 61;
		if (wave + 1 > waves.size()) {
			this.text("Next Wave: None", 805, textOffset);
		} else {
			this.text("Next Wave: " + (wave + 1), 805, textOffset);
		}
		this.text("Speed: x" + GlobalModifiers.multiplier, 805, 10 + textOffset);
		this.text("Enemies: " + mobs.size(), 805, 20 + textOffset);
		this.text("Money: " + money, 805, 30 + textOffset);
		this.text("Selection Type:", 805, 40 + textOffset);
		if (selectionType == 0) {
			this.text("Mouse", 805, 50 + textOffset);
		} else if (selectionType == -1) {
			this.text("Delete", 805, 50 + textOffset);
		} else if (selectionType == -2) {
			this.text("Lava", 805, 50 + textOffset);
		} else if (selectionType == -3) {
			this.text("Spikes", 805, 50 + textOffset);
		} else if (selectionType == -4) {
			this.text("Mines", 805, 50 + textOffset);
		} else if (selectionType == -5) {
			this.text("Sticky Trap", 805, 50 + textOffset);
		} else if (selectionType == 1) {
			this.text("Regular Tower", 805, 50 + textOffset);
			this.text("Range: " + 2, 805, 60 + textOffset);
			this.text("Damage: " + 20, 805, 70 + textOffset);
			this.text("Firing Rate: " + 30, 805, 80 + textOffset);
		} else if (selectionType == 2) {
			this.text("Splash Tower", 805, 50 + textOffset);
			this.text("Range: " + 4, 805, 60 + textOffset);
			this.text("Damage: " + 20 + " (3x3)", 805, 70 + textOffset);
			this.text("Firing Rate: " + 60, 805, 80 + textOffset);
		} else if (selectionType == 3) {
			this.text("Freeze Tower", 805, 50 + textOffset);
			this.text("Range: " + 4, 805, 60 + textOffset);
			this.text("Damage: Freeze", 805, 70 + textOffset);
			this.text("Firing Rate: " + 30, 805, 80 + textOffset);
		} else if (selectionType == 4) {
			this.text("MGT", 805, 50 + textOffset);
			this.text("Range: " + 3, 805, 60 + textOffset);
			this.text("Damage: " + 20, 805, 70 + textOffset);
			this.text("Firing Rate: " + 6, 805, 80 + textOffset);
		} else if (selectionType == 5) {
			this.text("Slow Tower", 805, 50 + textOffset);
			this.text("Range: " + 5, 805, 60 + textOffset);
			this.text("Damage: Slow 80%" + " (5x5)", 805, 70 + textOffset);
			this.text("Firing Rate: " + 60, 805, 80 + textOffset);
		} else if (selectionType == 6) {
			this.text("Laser Tower", 805, 50 + textOffset);
			this.text("Range: " + 9, 805, 60 + textOffset);
			this.text("Damage: " + 5, 805, 70 + textOffset);
			this.text("Firing Rate: " + 1, 805, 80 + textOffset);
		} else if (selectionType == 7) {
			this.text("Cannon", 805, 50 + textOffset);
			this.text("Range: " + 4, 805, 60 + textOffset);
			this.text("Damage: " + 250, 805, 70 + textOffset);
			this.text("Firing Rate: " + 50, 805, 80 + textOffset);
		} else if (selectionType == 8) {
			this.text("Electric Tower", 805, 50 + textOffset);
			this.text("Range: " + 4, 805, 60 + textOffset);
			this.text("Damage: " + 40 + " x 5 (Chain)", 805, 70 + textOffset);
			this.text("Firing Rate: " + 50, 805, 80 + textOffset);
		} else if (selectionType == 9) {
			this.text("Bombardment Tower", 805, 50 + textOffset);
			this.text("Range: " + "Infinity (Targeted)", 805, 60 + textOffset);
			this.text("Damage: " + 400 + " (5x5)", 805, 70 + textOffset);
			this.text("Firing Rate: " + 100, 805, 80 + textOffset);
		}
		if (selectionType > 0) {
			this.text("Cost: " + cost[selectionType - 1], 805, 90 + textOffset);
		}
		if (selectionType < -1) {
			this.text("Cost: " + trapcost[selectionType * -1 - 2], 805,
					60 + textOffset);
		}

		this.text("Health: " + health, 805, 170);
		if (targetWarning) {
			this.fill(255, 0, 0, 255);
			this.text("Cannot target during", 805, 340);
			this.text("        wave", 805, 350);
		}
		this.rectMode(CORNER);
		this.fill(0, 255, 0, 125);
		this.stroke(0, 255, 0, 255);
		this.rect(805, 0, 80, 50);
		this.fill(0, 0, 0, 255);
		this.text("Next Wave", 815, 30);
	}

	private void checkHighlight() {
		double distance1 = Math.sqrt(Math.pow((mouseX + dragX - 700 - 710), 2)
				+ Math.pow((mouseY + dragY - 315), 2));
		double distance2 = Math.sqrt(Math.pow((mouseX + dragX - 700 - 610), 2)
				+ Math.pow((mouseY + dragY - 200), 2));
		double distance3 = Math.sqrt(Math.pow((mouseX + dragX - 700 - 547), 2)
				+ Math.pow((mouseY + dragY - 400), 2));
		double distance4 = Math.sqrt(Math.pow((mouseX + dragX - 700 - 476), 2)
				+ Math.pow((mouseY + dragY - 487), 2));
		double distance5 = Math.sqrt(Math.pow((mouseX + dragX - 700 - 556), 2)
				+ Math.pow((mouseY + dragY - 553), 2));
		if (distance1 < 10) {
			this.stroke(255, 255, 255, 255);
			this.fill(0, 0, 0, 125);
			this.rect(1380, 239, 60, 12);
			this.fill(255, 255, 255, 255);
			this.text("Level 1", 1390, 250);
		}
		if (distance2 < 10) {
			this.stroke(255, 255, 255, 255);
			this.fill(0, 0, 0, 125);
			this.rect(1280, 134, 60, 12);
			this.fill(255, 255, 255, 255);
			this.text("Level 2", 1290, 145);
		}
		if (distance3 < 10) {
			this.stroke(255, 255, 255, 255);
			this.fill(0, 0, 0, 125);
			this.rect(1217, 334, 60, 12);
			this.fill(255, 255, 255, 255);
			this.text("Level 3", 1227, 345);
		}
		if (distance4 < 10) {
			this.stroke(255, 255, 255, 255);
			this.fill(0, 0, 0, 125);
			this.rect(1146, 451, 60, 12);
			this.fill(255, 255, 255, 255);
			this.text("Level 4", 1156, 462);
		}
		if (distance5 < 10) {
			this.stroke(255, 255, 255, 255);
			this.fill(0, 0, 0, 125);
			this.rect(1226, 517, 60, 12);
			this.fill(255, 255, 255, 255);
			this.text("Level 5", 1236, 528);
		}
	}

	public void spawnWave() {
		if (wave < waves.size()) {
			Mob m = waves.get(wave).getNextMob(map, this, mobs);
			if (m != null) {
				mobs.add(m);
			} else {
				if (wave < waves.size()) {
					wave++;
					spawning = false;
				}
			}

		}
	}

	/*
	 * public void spawnMob() { Mob m; if (Math.random() > 0.6) { m = new
	 * Mob(map.getMainPath(0), 0.07, this, "Jelly.png", 100, 20, 1, 20); } else
	 * if (Math.random() > 0.4) { m = new Mob(map.getMainPath(0), 0.14, this,
	 * "LightningJelly.png", 70, 30, 1, 20); } else if (Math.random() > 0.3) { m
	 * = new Mob(map.getMainPath(0), 0.04, this, "BigJelly.png", 700, 50, 1,
	 * 150); } else if (Math.random() > 0.1) { m = new
	 * SplittingMob(map.getMainPath(0), 0.05, this, "SplittingJelly.png", 200,
	 * 30, mobs, 1); } else { m = new Mob(map.getMainPath(0), 0.08, this,
	 * "FullGhostKnight.png", 700, 50, 1, 170); } mobs.add(m); }
	 */

	public void keyPressed() {
		if (levelInitiate) {
			if (Character.isDigit(this.key)) {
				String s = "";
				s += this.key;
				GlobalModifiers.multiplier = Integer.parseInt(s);
			}
			if (this.key == 'p') {
				continuousOption = !continuousOption;
			}
			if (this.key == 'o'){
				GlobalModifiers.showDamage = !GlobalModifiers.showDamage;
			}
			if (this.key == 'u') {
				selectionType = -5;
			}
			if (this.key == 'v') {
				selectionType = -4;
			}
			if (this.key == 'x') {
				selectionType = -3;
			}
			if (this.key == 'n') {
				selectionType = -2;
			}
			if (this.key == 'q') {
				selectionType = -1;
			}
			if (this.key == 'w') {
				selectionType = 0;
			}
			if (this.key == 'c') {
				selectionType = 1;
			}
			if (this.key == 's') {
				selectionType = 2;
			}
			if (this.key == 'f') {
				selectionType = 3;
			}
			if (this.key == 'm') {
				selectionType = 4;
			}
			if (this.key == 'd') {
				selectionType = 5;
			}
			if (this.key == 'l') {
				selectionType = 6;
			}
			if (this.key == 'a') {
				selectionType = 7;
			}
			if (this.key == 'e') {
				selectionType = 8;
			}
			if (this.key == 'b') {
				selectionType = 9;
			}
			if (this.key == 'h') {
				if (rate == 99) {
					rate = 59;
				} else {
					rate = 99;
				}
			}
		}
	}

	public void mouseReleased() {
		if (mainScreen){
			if (mouseX > 300 && mouseX < 500 && mouseY > 300
					&& mouseY < 350) {
				mainScreen = false;
			}
		} else if (!levelInitiate) {
			double distance1 = Math.sqrt(Math.pow((mouseX + dragX - 700 - 710),
					2) + Math.pow((mouseY + dragY - 315), 2));
			double distance2 = Math.sqrt(Math.pow((mouseX + dragX - 700 - 610),
					2) + Math.pow((mouseY + dragY - 200), 2));
			double distance3 = Math.sqrt(Math.pow((mouseX + dragX - 700 - 547),
					2) + Math.pow((mouseY + dragY - 400), 2));
			double distance4 = Math.sqrt(Math.pow((mouseX + dragX - 700 - 476),
					2) + Math.pow((mouseY + dragY - 487), 2));
			double distance5 = Math.sqrt(Math.pow((mouseX + dragX - 700 - 556),
					2) + Math.pow((mouseY + dragY - 553), 2));
			if (distance1 < 10) {
				map.generate("map1.grid", 128, 64, 0, 0, 255, 0);
				loadWaves("level1.w");
				levelInitiate = true;
				money = 300;
				mobs = new ArrayList<Mob>();
				wave = 0;
			}
			if (distance2 < 10) {
				map.generate("map2.grid", 128, 64, 0, 125, 125, 125);
				loadWaves("level2.w");
				levelInitiate = true;
				money = 300;
				mobs = new ArrayList<Mob>();
				wave = 0;
			}
			if (distance3 < 10) {
				map.generate("map3.grid", 128, 64, 0, 125, 125, 125);
				map.generateSidePath("map3b.grid", 128, 64, 0, 125, 125, 125);
				loadWaves("level3.w");
				levelInitiate = true;
				money = 450;
				mobs = new ArrayList<Mob>();
				wave = 0;
			}
			if (distance4 < 10) {
				map.generate("map4.grid", 128, 64, 0, 75, 255, 75);
				map.generateSidePath("map4b.grid", 128, 64, 0, 125, 125, 125);
				map.generateSidePath("map4c.grid", 128, 64, 0, 125, 125, 125);
				map.generateSidePath("map4d.grid", 128, 64, 0, 125, 125, 125);
				loadWaves("level4.w");
				levelInitiate = true;
				money = 500;
				mobs = new ArrayList<Mob>();
				wave = 0;
			}
			if (distance5 < 10) {
				map.generate("map5.grid", 128, 64, 0, 75, 255, 75);
				loadWaves("level4.w");
				levelInitiate = true;
				money = 450;
				mobs = new ArrayList<Mob>();
				wave = 0;
			}
		} else {
			double scaleX = mouseX / scale;
			double scaleY = mouseY / scale;

			if (targeting) {
				((BombardmentTower) selected).target = map.getSquare(
						(double) scaleX, (double) scaleY);
				targeting = false;
			}
			targetWarning = false;
			if (towerSelected) {
				if (selected instanceof BombardmentTower) {
					if (scaleX > 805 && scaleX < 885 && scaleY > 280
							&& scaleY < 330) {
						if (spawning == false && !(mobs.size() > 0)) {
							targeting = true;
						} else {
							targetWarning = true;
						}
					}
				}
				if (scaleX > 805 && scaleX < 935 && scaleY > 480
						&& scaleY < 530) {
					if (selected.upgradeRangeCost() != 0) {
						if (money >= selected.upgradeRangeCost()) {
							money -= selected.upgradeRangeCost();
							selected.upgradeRange();
						}
					}
				}
				if (scaleX > 805 && scaleX < 935 && scaleY > 540
						&& scaleY < 590) {
					if (selected.upgradeDamageCost() != 0) {
						if (money >= selected.upgradeDamageCost()) {
							money -= selected.upgradeDamageCost();
							selected.upgradeDamage();
						}
					}
				}
				if (scaleX > 805 && scaleX < 935 && scaleY > 600
						&& scaleY < 650) {
					if (selected.upgradeFiringRateCost() != 0) {
						if (money >= selected.upgradeFiringRateCost()) {
							money -= selected.upgradeFiringRateCost();
							selected.upgradeFiringRate();
						}
					}
				}
				if (scaleX > 805 && scaleX < 935 && scaleY > 660
						&& scaleY < 710) {
					if (selected.upgradeSpecialCost() != 0) {
						if (selected instanceof ElementalTower) {
							if (elementSelection == false
									&& selected.elementLevel == 0) {
								elementSelection = true;
							}
						} else {
							if (money >= selected.upgradeSpecialCost()) {
								money -= selected.upgradeSpecialCost();
								selected.upgradeSpecial();
							}
						}
						if (selected.elementLevel > 0) {
							if (money >= selected.upgradeSpecialCost()) {
								money -= selected.upgradeSpecialCost();
								selected.upgradeSpecial();
							}
						}
					}
				} else if (elementSelection) {
					if (money >= selected.upgradeSpecialCost()) {
						if (scaleX > 825 && scaleX < 863 && scaleY > 720
								&& scaleY < 750) {
							selected.elementalType = 1;
							money -= selected.upgradeSpecialCost();
							selected.upgradeSpecial();
						} else if (scaleX > 865 && scaleX < 903 && scaleY > 720
								&& scaleY < 750) {
							selected.elementalType = 2;
							money -= selected.upgradeSpecialCost();
							selected.upgradeSpecial();
						} else if (scaleX > 825 && scaleX < 863 && scaleY > 752
								&& scaleY < 782) {
							selected.elementalType = 3;
							money -= selected.upgradeSpecialCost();
							selected.upgradeSpecial();
						} else if (scaleX > 865 && scaleX < 903 && scaleY > 752
								&& scaleY < 782) {
							selected.elementalType = 4;
							money -= selected.upgradeSpecialCost();
							selected.upgradeSpecial();
						}
						elementSelection = false;
					}
				}
			}
			if (scaleX < 800 && scaleY < 800 && scaleX > 0 && scaleY > 0) {
				if (!(selectionType > 0 && cost[selectionType - 1] > money)
						|| map.getSquare((double) scaleX, (double) scaleY).t != null) {
					if (selectionType == 0) {
						if (map.getSquare((double) scaleX, (double) scaleY).t != null) {
							towerSelected = true;
							selected = map.getSquare((double) scaleX,
									(double) scaleY).t;
						} else {
							towerSelected = false;
						}
					} else if (selectionType > 0) {
						if (map.getSquare((double) scaleX, (double) scaleY).path == false
								&& map.getSquare((double) scaleX,
										(double) scaleY).water == false) {
							if (map.getSquare((double) scaleX, (double) scaleY).t == null) {
								money -= cost[selectionType - 1];
								Object[] para = {
										map.getSquare((double) scaleX,
												(double) scaleY),
										new Integer(range[selectionType - 1]) };
								Class<?>[] params = { GridSquare.class,
										Integer.class };
								Constructor<FiringTower> cons = null;
								try {
									cons = (Constructor<FiringTower>) types[selectionType - 1]
											.getConstructor(params);
								} catch (SecurityException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (NoSuchMethodException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								FiringTower temp3 = null;
								try {
									temp3 = cons.newInstance(para);
								} catch (IllegalArgumentException e) {
									e.printStackTrace();
								} catch (InstantiationException e) {
									e.printStackTrace();
								} catch (IllegalAccessException e) {
									e.printStackTrace();
								} catch (InvocationTargetException e) {
									e.printStackTrace();
								}
								map.getSquare((double) scaleX, (double) scaleY)
										.setTower(temp3);
							}
							towerSelected = true;
							selected = map.getSquare((double) scaleX,
									(double) scaleY).t;
						}
					} else if (selectionType == -1) {
						if (map.getSquare((double) scaleX, (double) scaleY).path == false) {
							if (!(map.getSquare((double) scaleX,
									(double) scaleY).t == null)) {
								map.getSquare((double) scaleX, (double) scaleY)
										.deleteTower();
							}
						} else if (map.getSquare((double) scaleX,
								(double) scaleY).path == true) {
							if (map.getSquare((double) scaleX, (double) scaleY).trap > 0) {
								map.getSquare((double) scaleX, (double) scaleY)
										.deleteTrap();
							}
						}
					} else if (selectionType < -1 && trapcost[selectionType*-1 - 2] <= money) {
						if (selectionType == -2) {

							if (map.getSquare((double) scaleX, (double) scaleY).path == true) {
								if (map.getSquare((double) scaleX,
										(double) scaleY).trap == 0) {
									map.getSquare((double) scaleX,
											(double) scaleY).setTrap(lava, 1, 1);
									money -= trapcost[selectionType*-1 - 2];
								}
							}
						} else if (selectionType == -3) {
							if (map.getSquare((double) scaleX, (double) scaleY).path == true) {
								if (map.getSquare((double) scaleX,
										(double) scaleY).trap == 0) {
									map.getSquare((double) scaleX,
											(double) scaleY).setTrap(spikes, 2,3, 200, 200);
									money -= trapcost[selectionType*-1 - 2];
								}
							}
						} else if (selectionType == -4) {
							if (map.getSquare((double) scaleX, (double) scaleY).path == true) {
								if (map.getSquare((double) scaleX,
										(double) scaleY).trap == 0) {
									map.getSquare((double) scaleX,
											(double) scaleY).setTrap(mine, 3,200);
									money -= trapcost[selectionType*-1 - 2];
								}
							}
						} else if (selectionType == -5) {
							if (map.getSquare((double) scaleX, (double) scaleY).path == true) {
								if (map.getSquare((double) scaleX,
										(double) scaleY).trap == 0) {
									map.getSquare((double) scaleX,
											(double) scaleY).setTrap(slow, 4, 0);
									money -= trapcost[selectionType*-1 - 2];
								}
							}
						}
					}
				} else {
					towerSelected = false;

				}
			} else {
				selectionType = sPane.checkCollision(scaleX, scaleY);
			}
		}

	}

	public void mouseWheelMoved(MouseWheelEvent e) {
		if (e.getWheelRotation() > 0) {
			if (scale < 1) {
				scale += 0.1F;
			}

		} else if (scale > 0.1) {
			scale -= 0.1F;
		}

	}

	private void loadWaves(String string) {
		String[] wavedata = loadStrings(string);
		waves = new ArrayList<Wave>();
		for (int i = 0; i < wavedata.length; i++) {
			waves.add(new Wave(wavedata[i]));
		}
	}



