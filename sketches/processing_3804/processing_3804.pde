
import java.awt.Color;

public class Cuerpo {
	 float x;
	 float y;
	float a;
	float b;
	private float m;
	int sentido;
	int min, sup;
	char movimiento;
	boolean mover;
	
	 float vx = 0;
	  float vy = 0;
	  
	
	
	private int id;
	private float pChoqueX;
	private float pChoqueY;	
	
	Color col;
	public float getA() {
		return a;
	}

	public boolean isMover() {
		return mover;
	}

	public void setMover(boolean mover) {
		this.mover = mover;
	}

	public void setA(float a) {
		this.a = a;
	}

	public float getB() {
		return b;
	}

	public void setB(float b) {
		this.b = b;
	}

	// default constructor
	Cuerpo() {
	}

	public Cuerpo(float x, float y, float a,float b, int s, boolean mover) {
		this.x = x;
		this.y = y;
		this.a = a;
		this.b = b;
		this.sentido = s;
		this.mover = mover;
		m = a*(float).1;
	}

	public float getM() {
		return m;
	}

	public void setM(float m) {
		this.m = m;
	}

	public void acotarCuerpo(int id,int min, int sup, char c, Color col){
                this.id = id;
		this.min = min;
		this.sup = sup;
		this.movimiento = c;
		this.col = col;
	}


	public Color getColor() {
		return col;
	}

	public void setColor(Color col) {
		this.col = col;
	}

	public float getX() {
		return x;
	}

	public void setX(float x) {
		this.x = x;
	}

	public float getY() {
		return y;
	}

	public void setY(float y) {
		this.y = y;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public char getMovimiento() {
		return movimiento;
	}

	public void setMovimiento(char movimiento) {
		this.movimiento = movimiento;
	}

	public int getSentido() {
		return sentido;
	}

	public void setSentido(int sentido) {
		this.sentido = sentido;
	}

	public int getSup() {
		return sup;
	}

	public void setSup(int sup) {
		this.sup = sup;
	}

	public float getPChoqueX() {
		return pChoqueX;
	}

	public void setPChoqueX(float choqueX) {
		pChoqueX = choqueX;
	}

	public float getPChoqueY() {
		return pChoqueY;
	}

	public void setPChoqueY(float choqueY) {
		pChoqueY = choqueY;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}

