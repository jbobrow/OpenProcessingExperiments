

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;

import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;

import processing.serial.*;

public class Thermal implements SerialPortEventListener {
  
        public Boolean[][] totalWhite = { new Boolean[] { false, false, false }, new Boolean[] { false, false, false },
			new Boolean[] { false, false, false } };

	public Boolean[][] gray10Percent = { new Boolean[] { false, false, false }, new Boolean[] { false, true, false },
			new Boolean[] { false, false, false } };

	public Boolean[][] gray20Percent = { new Boolean[] { false, false, true }, new Boolean[] { false, false, false },
			new Boolean[] { true, false, false } };

	public Boolean[][] gray30Percent = { new Boolean[] { false, false, true }, new Boolean[] { false, true, false },
			new Boolean[] { true, false, false } };

	public Boolean[][] gray40Percent = { new Boolean[] { false, true, false }, new Boolean[] { true, false, true },
			new Boolean[] { false, true, false } };

	public Boolean[][] gray50Percent = { new Boolean[] { true, false, true }, new Boolean[] { false, true, false },
			new Boolean[] { true, false, true } };

	public Boolean[][] gray60Percent = { new Boolean[] { false, true, true }, new Boolean[] { true, false, true },
			new Boolean[] { true, true, false } };

	public Boolean[][] gray70Percent = { new Boolean[] { true, false, true }, new Boolean[] { true, true, true },
			new Boolean[] { true, false, true } };

	public Boolean[][] gray80Percent = { new Boolean[] { true, true, true }, new Boolean[] { true, false, true },
			new Boolean[] { true, true, true } };

	public Boolean[][] totalBlack = { new Boolean[] { true, true, true }, new Boolean[] { true, true, true },
			new Boolean[] { true, true, true } };

	public byte[] bmp = { (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00,
			(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00,
			(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x60, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00,
			(byte) 0x00, (byte) 0x01, (byte) 0xE0, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00,
			(byte) 0x03, (byte) 0xE0, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x07,
			(byte) 0xF0, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x0F, (byte) 0xF0,
			(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x1F, (byte) 0xF0, (byte) 0x00,
			(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x3F, (byte) 0xF8, (byte) 0x00, (byte) 0x00,
			(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x3F, (byte) 0xF8, (byte) 0x00, (byte) 0x00, (byte) 0x00,
			(byte) 0x00, (byte) 0x00, (byte) 0x7F, (byte) 0xF8, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00,
			(byte) 0x00, (byte) 0x7F, (byte) 0xF8, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00,
			(byte) 0xFF, (byte) 0xFC, (byte) 0x00, (byte) 0x00, (byte) 0x07, (byte) 0xC0, (byte) 0x00, (byte) 0xFF,
			(byte) 0xFC, (byte) 0x00, (byte) 0x00, (byte) 0xFF, (byte) 0xFE, (byte) 0x00, (byte) 0xFF, (byte) 0xFC,
			(byte) 0x00, (byte) 0x00, (byte) 0x7F, (byte) 0xFF, (byte) 0x81, (byte) 0xFF, (byte) 0xFC, (byte) 0x00,
			(byte) 0x00, (byte) 0x7F, (byte) 0xFF, (byte) 0xE1, (byte) 0xFF, (byte) 0xFC, (byte) 0x00, (byte) 0x00,
			(byte) 0x7F, (byte) 0xFF, (byte) 0xF1, (byte) 0xF8, (byte) 0xF8, (byte) 0x00, (byte) 0x00, (byte) 0x3F,
			(byte) 0xFF, (byte) 0xF9, (byte) 0xF8, (byte) 0x78, (byte) 0x00, (byte) 0x00, (byte) 0x3F, (byte) 0xFF,
			(byte) 0xFF, (byte) 0xF0, (byte) 0x78, (byte) 0x00, (byte) 0x00, (byte) 0x3F, (byte) 0xFF, (byte) 0xFF,
			(byte) 0xF0, (byte) 0x78, (byte) 0x00, (byte) 0x00, (byte) 0x3F, (byte) 0xFF, (byte) 0xFF, (byte) 0xF0,
			(byte) 0xFC, (byte) 0x1C, (byte) 0x00, (byte) 0x1F, (byte) 0xFE, (byte) 0x0F, (byte) 0xE0, (byte) 0xFF,
			(byte) 0xFF, (byte) 0x80, (byte) 0x1F, (byte) 0xFE, (byte) 0x03, (byte) 0xE0, (byte) 0xFF, (byte) 0xFF,
			(byte) 0xC0, (byte) 0x0F, (byte) 0xFF, (byte) 0x01, (byte) 0xE0, (byte) 0xFF, (byte) 0xFF, (byte) 0xF0,
			(byte) 0x0F, (byte) 0xFF, (byte) 0x00, (byte) 0xE1, (byte) 0xFF, (byte) 0xFF, (byte) 0xF8, (byte) 0x07,
			(byte) 0xFF, (byte) 0xC0, (byte) 0x73, (byte) 0xFF, (byte) 0xFF, (byte) 0xFC, (byte) 0x01, (byte) 0xFF,
			(byte) 0xE0, (byte) 0x7F, (byte) 0xFF, (byte) 0xFF, (byte) 0xFE, (byte) 0x00, (byte) 0x7F, (byte) 0xFC,
			(byte) 0xFF, (byte) 0x83, (byte) 0xFF, (byte) 0xFF, (byte) 0x00, (byte) 0x1F, (byte) 0xFF, (byte) 0xFC,
			(byte) 0x00, (byte) 0x7F, (byte) 0xFF, (byte) 0x00, (byte) 0x1F, (byte) 0xFF, (byte) 0xFC, (byte) 0x00,
			(byte) 0x7F, (byte) 0xFE, (byte) 0x00, (byte) 0x1F, (byte) 0xFF, (byte) 0xFC, (byte) 0x00, (byte) 0x7F,
			(byte) 0xFE, (byte) 0x00, (byte) 0x1F, (byte) 0xF8, (byte) 0x7F, (byte) 0x01, (byte) 0xFF, (byte) 0xFC,
			(byte) 0x00, (byte) 0x1F, (byte) 0xF0, (byte) 0x7F, (byte) 0xFF, (byte) 0xFF, (byte) 0xFC, (byte) 0x00,
			(byte) 0x3F, (byte) 0xE0, (byte) 0x71, (byte) 0xFF, (byte) 0xFF, (byte) 0xF8, (byte) 0x00, (byte) 0xFF,
			(byte) 0xC0, (byte) 0xE1, (byte) 0xFF, (byte) 0xFF, (byte) 0xF0, (byte) 0x01, (byte) 0xFF, (byte) 0x81,
			(byte) 0xE0, (byte) 0xFF, (byte) 0xFF, (byte) 0xF0, (byte) 0x01, (byte) 0xFF, (byte) 0x81, (byte) 0xE0,
			(byte) 0xF8, (byte) 0xFF, (byte) 0xE0, (byte) 0x03, (byte) 0xFF, (byte) 0x03, (byte) 0xE0, (byte) 0xF8,
			(byte) 0x3F, (byte) 0x80, (byte) 0x07, (byte) 0xFF, (byte) 0x0F, (byte) 0xF0, (byte) 0xFC, (byte) 0x00,
			(byte) 0x00, (byte) 0x07, (byte) 0xFF, (byte) 0xFF, (byte) 0xF0, (byte) 0x7C, (byte) 0x00, (byte) 0x00,
			(byte) 0x07, (byte) 0xFF, (byte) 0xFF, (byte) 0xF0, (byte) 0x7E, (byte) 0x00, (byte) 0x00, (byte) 0x0F,
			(byte) 0xFF, (byte) 0xFC, (byte) 0xF8, (byte) 0x7E, (byte) 0x00, (byte) 0x00, (byte) 0x0F, (byte) 0xFF,
			(byte) 0xFC, (byte) 0xF8, (byte) 0xFF, (byte) 0x00, (byte) 0x00, (byte) 0x0F, (byte) 0xFF, (byte) 0xF8,
			(byte) 0xFF, (byte) 0xFF, (byte) 0x00, (byte) 0x00, (byte) 0x0F, (byte) 0xFF, (byte) 0xF0, (byte) 0x7F,
			(byte) 0xFF, (byte) 0x00, (byte) 0x00, (byte) 0x1F, (byte) 0xFF, (byte) 0xC0, (byte) 0x7F, (byte) 0xFF,
			(byte) 0x80, (byte) 0x00, (byte) 0x1F, (byte) 0xFF, (byte) 0x80, (byte) 0x3F, (byte) 0xFF, (byte) 0x80,
			(byte) 0x00, (byte) 0x1F, (byte) 0xFC, (byte) 0x00, (byte) 0x3F, (byte) 0xFF, (byte) 0x80, (byte) 0x00,
			(byte) 0x07, (byte) 0x00, (byte) 0x00, (byte) 0x3F, (byte) 0xFF, (byte) 0x80, (byte) 0x00, (byte) 0x00,
			(byte) 0x00, (byte) 0x00, (byte) 0x1F, (byte) 0xFF, (byte) 0x80, (byte) 0x00, (byte) 0x00, (byte) 0x00,
			(byte) 0x00, (byte) 0x0F, (byte) 0xFF, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00,
			(byte) 0x0F, (byte) 0xFF, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x07,
			(byte) 0xFF, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x03, (byte) 0xFE,
			(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0xFC, (byte) 0x00,
			(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x38, (byte) 0x00, (byte) 0x00,
			(byte) 0x30, (byte) 0x78, (byte) 0x30, (byte) 0x30, (byte) 0x2C, (byte) 0x20, (byte) 0x30 };
  
        public int whiteColor = 0xFFFFFFFF; // white
	public int blackColor = 0x000000; // white
  
	/** The port we're normally going to use. */
	private ArrayList<String> PORT_NAMES;
        private String PORT_NAME;
	/** Buffered input stream from the port */
	private InputStream input;
	/** The output stream to the port */
	private OutputStream output;
	private PrintWriter pw;
	/** Milliseconds to block while waiting for port open */
	private final int TIME_OUT = 2000;
	/** Default bits per second for COM port. */
	private int DATA_RATE = 19200;

	private int _bitmapLineSleepTimeMs = 40;

	/**
	 * 80 is default from page 23 of datasheet. Controls speed of printing and
	 * darkness
	 */
	private int _heatTime = 80;
	/**
	 * 2 is default from page 23 of datasheet.Controls speed of printing and
	 * darkness
	 */
	private int _heatInterval = 2;
	/**
	 * Not sure what the defaut is. Testing shows the max helps darken text.
	 * From page 23.
	 */
	private int _printDensity = 15;
	/**
	 * Not sure what the defaut is. Testing shows the max helps darken text.
	 * From page 23.
	 */
	private int _printBreakTime = 15;
	private SerialPort serialPort;
        //private Serial serialPort;

	/**
	 * A thermal printer POS object.
	 * 
	 * @param baudRate
	 *            The baud rate of the printer
	 * @param port
	 *            The port of to which the printer is connected
	 */
	public Thermal(int baudRate, String port) {
		DATA_RATE = baudRate;
		PORT_NAMES = new ArrayList();
		PORT_NAMES.add(port);
                PORT_NAME = port;
		connect();
		init();
		setDefault();
	}

	/**
	 * Connect to the printer. It is called in the constructor so it is declared
	 * private.
	 */
	private void connect() {
                
		
                CommPortIdentifier portId = null;
		Enumeration<?> portEnum = CommPortIdentifier.getPortIdentifiers();

		// iterate through, looking for the port
		while (portEnum.hasMoreElements()) {
			CommPortIdentifier currPortId = (CommPortIdentifier) portEnum.nextElement();
			for (String portName : PORT_NAMES) {
				if (currPortId.getName().equals(portName)) {
					portId = currPortId;
					break;
				}
			}
		}

		if (portId == null) {
			System.out.println("Could not find COM port.");
			return;
		}

		try {
                        
			// open serial port, and use class name for the appName.
			serialPort = (SerialPort) portId.open(this.getClass().getName(), TIME_OUT);

			// set port parameters
			serialPort.setSerialPortParams(DATA_RATE, SerialPort.DATABITS_8, SerialPort.STOPBITS_1,
					SerialPort.PARITY_NONE);
                        
                        //serialPort = new Serial(this, PORT_NAME, DATA_RATE);
                        
			// open the streams
			input = serialPort.getInputStream();
			output = serialPort.getOutputStream();
			pw = new PrintWriter(output);
			// add event listeners
			serialPort.addEventListener(this);
			serialPort.notifyOnDataAvailable(true);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
                
	}

	/**
	 * Setup the printer _heatTime and _heatInterval
	 */
	private void init() {
		write(new byte[] { 27, 55, 7, (byte) ((_heatTime << 24) >> 24), (byte) ((_heatInterval << 24) >> 24) });

		// Modify the print density and timeout
		write(new byte[] { 18, 35 });

		int printSetting = (_printDensity << 4) | _printBreakTime;
		write(new byte[] { (byte) ((printSetting << 24) >> 24) }); // Combination
																	// of
																	// printDensity
																	// and
																	// printBreakTime
	}

	/**
	 * Reset the printer to the default values. Set justification to "left",
	 * inverse off, double height off, line height to 32, bold off, underline
	 * off, barcode height to 50, text size to "small";
	 */
	public void setDefault() {
		wake();
		justify("L");
		inverseOff();
		doubleHeightOff();
		setLineHeight(32);
		boldOff();
		underlineOff();
		setBarcodeHeight(50);
		setSize("s");
	}

	/**
	 * Print a test line and feed the paper
	 */
	public void test() {
		println("Hello World!");
		feed(2);
	}

	/**
	 * Method to print a TEST bitmap.
	 * 
	 * @param height
	 *            Height of bitmap in pixels
	 * @param width
	 *            Width of bitmap in pixels
	 * @param bmp
	 *            byte array cointaining the bitmap data. Each pixel is
	 *            represeneted by a single bit in the byte array.
	 */
	public void testBitmap() {
		byte[] bmp = { (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00,
				(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00,
				(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x60, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00,
				(byte) 0x00, (byte) 0x01, (byte) 0xE0, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00,
				(byte) 0x03, (byte) 0xE0, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x07,
				(byte) 0xF0, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x0F, (byte) 0xF0,
				(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x1F, (byte) 0xF0, (byte) 0x00,
				(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x3F, (byte) 0xF8, (byte) 0x00, (byte) 0x00,
				(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x3F, (byte) 0xF8, (byte) 0x00, (byte) 0x00, (byte) 0x00,
				(byte) 0x00, (byte) 0x00, (byte) 0x7F, (byte) 0xF8, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00,
				(byte) 0x00, (byte) 0x7F, (byte) 0xF8, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00,
				(byte) 0xFF, (byte) 0xFC, (byte) 0x00, (byte) 0x00, (byte) 0x07, (byte) 0xC0, (byte) 0x00, (byte) 0xFF,
				(byte) 0xFC, (byte) 0x00, (byte) 0x00, (byte) 0xFF, (byte) 0xFE, (byte) 0x00, (byte) 0xFF, (byte) 0xFC,
				(byte) 0x00, (byte) 0x00, (byte) 0x7F, (byte) 0xFF, (byte) 0x81, (byte) 0xFF, (byte) 0xFC, (byte) 0x00,
				(byte) 0x00, (byte) 0x7F, (byte) 0xFF, (byte) 0xE1, (byte) 0xFF, (byte) 0xFC, (byte) 0x00, (byte) 0x00,
				(byte) 0x7F, (byte) 0xFF, (byte) 0xF1, (byte) 0xF8, (byte) 0xF8, (byte) 0x00, (byte) 0x00, (byte) 0x3F,
				(byte) 0xFF, (byte) 0xF9, (byte) 0xF8, (byte) 0x78, (byte) 0x00, (byte) 0x00, (byte) 0x3F, (byte) 0xFF,
				(byte) 0xFF, (byte) 0xF0, (byte) 0x78, (byte) 0x00, (byte) 0x00, (byte) 0x3F, (byte) 0xFF, (byte) 0xFF,
				(byte) 0xF0, (byte) 0x78, (byte) 0x00, (byte) 0x00, (byte) 0x3F, (byte) 0xFF, (byte) 0xFF, (byte) 0xF0,
				(byte) 0xFC, (byte) 0x1C, (byte) 0x00, (byte) 0x1F, (byte) 0xFE, (byte) 0x0F, (byte) 0xE0, (byte) 0xFF,
				(byte) 0xFF, (byte) 0x80, (byte) 0x1F, (byte) 0xFE, (byte) 0x03, (byte) 0xE0, (byte) 0xFF, (byte) 0xFF,
				(byte) 0xC0, (byte) 0x0F, (byte) 0xFF, (byte) 0x01, (byte) 0xE0, (byte) 0xFF, (byte) 0xFF, (byte) 0xF0,
				(byte) 0x0F, (byte) 0xFF, (byte) 0x00, (byte) 0xE1, (byte) 0xFF, (byte) 0xFF, (byte) 0xF8, (byte) 0x07,
				(byte) 0xFF, (byte) 0xC0, (byte) 0x73, (byte) 0xFF, (byte) 0xFF, (byte) 0xFC, (byte) 0x01, (byte) 0xFF,
				(byte) 0xE0, (byte) 0x7F, (byte) 0xFF, (byte) 0xFF, (byte) 0xFE, (byte) 0x00, (byte) 0x7F, (byte) 0xFC,
				(byte) 0xFF, (byte) 0x83, (byte) 0xFF, (byte) 0xFF, (byte) 0x00, (byte) 0x1F, (byte) 0xFF, (byte) 0xFC,
				(byte) 0x00, (byte) 0x7F, (byte) 0xFF, (byte) 0x00, (byte) 0x1F, (byte) 0xFF, (byte) 0xFC, (byte) 0x00,
				(byte) 0x7F, (byte) 0xFE, (byte) 0x00, (byte) 0x1F, (byte) 0xFF, (byte) 0xFC, (byte) 0x00, (byte) 0x7F,
				(byte) 0xFE, (byte) 0x00, (byte) 0x1F, (byte) 0xF8, (byte) 0x7F, (byte) 0x01, (byte) 0xFF, (byte) 0xFC,
				(byte) 0x00, (byte) 0x1F, (byte) 0xF0, (byte) 0x7F, (byte) 0xFF, (byte) 0xFF, (byte) 0xFC, (byte) 0x00,
				(byte) 0x3F, (byte) 0xE0, (byte) 0x71, (byte) 0xFF, (byte) 0xFF, (byte) 0xF8, (byte) 0x00, (byte) 0xFF,
				(byte) 0xC0, (byte) 0xE1, (byte) 0xFF, (byte) 0xFF, (byte) 0xF0, (byte) 0x01, (byte) 0xFF, (byte) 0x81,
				(byte) 0xE0, (byte) 0xFF, (byte) 0xFF, (byte) 0xF0, (byte) 0x01, (byte) 0xFF, (byte) 0x81, (byte) 0xE0,
				(byte) 0xF8, (byte) 0xFF, (byte) 0xE0, (byte) 0x03, (byte) 0xFF, (byte) 0x03, (byte) 0xE0, (byte) 0xF8,
				(byte) 0x3F, (byte) 0x80, (byte) 0x07, (byte) 0xFF, (byte) 0x0F, (byte) 0xF0, (byte) 0xFC, (byte) 0x00,
				(byte) 0x00, (byte) 0x07, (byte) 0xFF, (byte) 0xFF, (byte) 0xF0, (byte) 0x7C, (byte) 0x00, (byte) 0x00,
				(byte) 0x07, (byte) 0xFF, (byte) 0xFF, (byte) 0xF0, (byte) 0x7E, (byte) 0x00, (byte) 0x00, (byte) 0x0F,
				(byte) 0xFF, (byte) 0xFC, (byte) 0xF8, (byte) 0x7E, (byte) 0x00, (byte) 0x00, (byte) 0x0F, (byte) 0xFF,
				(byte) 0xFC, (byte) 0xF8, (byte) 0xFF, (byte) 0x00, (byte) 0x00, (byte) 0x0F, (byte) 0xFF, (byte) 0xF8,
				(byte) 0xFF, (byte) 0xFF, (byte) 0x00, (byte) 0x00, (byte) 0x0F, (byte) 0xFF, (byte) 0xF0, (byte) 0x7F,
				(byte) 0xFF, (byte) 0x00, (byte) 0x00, (byte) 0x1F, (byte) 0xFF, (byte) 0xC0, (byte) 0x7F, (byte) 0xFF,
				(byte) 0x80, (byte) 0x00, (byte) 0x1F, (byte) 0xFF, (byte) 0x80, (byte) 0x3F, (byte) 0xFF, (byte) 0x80,
				(byte) 0x00, (byte) 0x1F, (byte) 0xFC, (byte) 0x00, (byte) 0x3F, (byte) 0xFF, (byte) 0x80, (byte) 0x00,
				(byte) 0x07, (byte) 0x00, (byte) 0x00, (byte) 0x3F, (byte) 0xFF, (byte) 0x80, (byte) 0x00, (byte) 0x00,
				(byte) 0x00, (byte) 0x00, (byte) 0x1F, (byte) 0xFF, (byte) 0x80, (byte) 0x00, (byte) 0x00, (byte) 0x00,
				(byte) 0x00, (byte) 0x0F, (byte) 0xFF, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00,
				(byte) 0x0F, (byte) 0xFF, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x07,
				(byte) 0xFF, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x03, (byte) 0xFE,
				(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0xFC, (byte) 0x00,
				(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x38, (byte) 0x00, (byte) 0x00,
				(byte) 0x30, (byte) 0x78, (byte) 0x30, (byte) 0x30, (byte) 0x2C, (byte) 0x20, (byte) 0x30 };

		int height = 57;
		int width = 57;
		printBitmap(width, height, bmp);
		// write(new byte[]{18,42,(byte)( (height << 24) >> 24 ),(byte)(
		// ((width/8) << 24) >> 24 )});
		// write(bmp);
		System.out.println("TEST BITMAP ARRAY.LENGTH=" + bmp.length);
	}

	/**
	 * 
	 * @param s
	 *            The barcode string to print
	 * @param type
	 *            The type of barcode. ( UPC-A = 0, UPC-E = 1, EAN13 = 2, EAN8 =
	 *            3, CODE39 = 4, , I25 = 5, CODEBAR = 6, CODE93 = 7, CODE128 =
	 *            8, CODE11 = 9, MSI = 10)
	 */
	public void printBarcode(String s, int type) {
		if (type < 0 && type > 10) {
			type = 0;
		}
		write(new byte[] { 29, 107, (byte) ((type << 24) >> 24) });
		for (int i = 0; i < s.length(); i++) {
			write(new byte[] { (byte) ((s.charAt(i) << 24) >> 24) });
		}
	}

	/**
	 * Method to print bitmaps. Each pixel is a bit (0 = black pixel / 1 = white
	 * pixel) so every line of the image is comprised of bytes each containing
	 * the data for 8 pixels in a row.
	 * 
	 * @param height
	 *            Height of bitmap in pixels
	 * @param width
	 *            Width of bitmap in pixels
	 * @param bmp
	 *            byte array cointaining the bitmap data. Each pixel is
	 *            represeneted by a single bit in the byte array.
	 */
	public void printBitmap(int width, int height, byte[] bmp) {
		int maxBitmapBytes = 200 * (width / 8);
		int recursion = bmp.length / maxBitmapBytes;
		/**
		 * If the image is higher than one row pause after each line so not to
		 * overrun the buffer of the printer
		 */

		if (bmp.length % maxBitmapBytes != 0) {
			recursion++;
		}
		_bitmapLineSleepTimeMs = 40;
		for (int x = 0; x < recursion; x++) {
			int start = x * maxBitmapBytes;
			int end = start + maxBitmapBytes;
			if (end > bmp.length) {
				end = bmp.length;
			}
			byte[] bmpLine = Arrays.copyOfRange(bmp, start, end);
			int newHeight = (int)(bmpLine.length / (float)width * 8);
			if (width == 384) {
				int calculatedHeight=(newHeight-((newHeight / 256)*256));
				int calculatedWidth=(newHeight / 256);
				write(new byte[] { 18, 118,(byte)calculatedHeight,(byte)calculatedWidth});
				write(bmpLine);
			}else if(width<384){
				write(new byte[] { 18, 42, (byte) ((newHeight << 24) >> 24), (byte) (((width / 8) << 24) >> 24) });
				write(bmpLine);
			}
			try {
				Thread.sleep(_bitmapLineSleepTimeMs);
			} catch (InterruptedException e) {
				System.out.println("bitmapLineSleep failed!");
			}
		}
		try {
			Thread.sleep(500);
		} catch (InterruptedException e) {
			System.out.println("bitmapLineSleep failed!");
		}
	}

	/**
	 * Wake the printer from sleep
	 */
	private void wake() {
		write(new byte[] { 27, 61, 1 });
	}

	/**
	 * Put the printer to sleep
	 */
	private void sleep() {
		write(new byte[] { 27, 61, 0 });
	}

	/**
	 * Set the text justification
	 * 
	 * @param justification
	 *            The justification of the text "L"(LEFT), "C"(CENTER) or
	 *            "R"(RIGHT)
	 */
	public void justify(String justification) {
		int pos = 0;
		if (justification.equals("l") || justification.equals("L")) {
			pos = 0;
		} else if (justification.equals("c") || justification.equals("C")) {
			pos = 1;
		} else if (justification.equals("r") || justification.equals("R")) {
			pos = 2;
		}
		write(new byte[] { 27, 97, (byte) ((pos << 24) >> 24) });
	}

	/**
	 * Inverse the text color. The text becomes white and the background black.
	 */
	public void inverseOn() {
		write(new byte[] { 27, 66, 1 });
	}

	/**
	 * Turn inverse text color off. The text becomes black and there is no
	 * background
	 */
	public void inverseOff() {
		write(new byte[] { 27, 66, 0, 10 });
	}

	/**
	 * Set the text height to double
	 */
	public void doubleHeightOn() {
		write(new byte[] { 27, 14 });
	}

	/**
	 * Set the text height to single
	 */
	public void doubleHeightOff() {
		write(new byte[] { 27, 20 });
	}

	/**
	 * Set the line height of the text
	 * 
	 * @param lineHeight
	 *            The new line height
	 */
	public void setLineHeight(int lineHeight) {
		write(new byte[] { 27, 51, (byte) ((lineHeight << 24) >> 24) });
	}

	/**
	 * Turn bold text on
	 */
	public void boldOn() {
		write(new byte[] { 27, 20, 1 });
	}

	/**
	 * Turn bold text off
	 */
	public void boldOff() {
		write(new byte[] { 27, 20, 0 });
	}

	/**
	 * Turn text underline on
	 */
	public void underlineOn() {
		write(new byte[] { 27, 45, 1 });
	}

	/**
	 * Turn text underline off
	 */
	public void underlineOff() {
		write(new byte[] { 27, 45, 0, 10 });
	}

	/**
	 * Set the barcode height in pixels
	 * 
	 * @param barcodeHeight
	 *            the new height of the barcode
	 */
	public void setBarcodeHeight(int barcodeHeight) {
		write(new byte[] { 27, 45, (byte) ((barcodeHeight << 24) >> 24) });
	}

	/**
	 * Set the text height
	 * 
	 * @param s
	 *            The size of the text "S"(SMALL), "M"(MEDIUM) or "L"(LARGE)
	 */
	public void setSize(String s) {
		int size = 0;
		if (s.equals("s") || s.equals("S")) {
			size = 0;
		} else if (s.equals("m") || s.equals("M")) {
			size = 10;
		} else if (s.equals("l") || s.equals("L")) {
			size = 25;
		}
		write(new byte[] { 29, 33, (byte) ((size << 24) >> 24), 10 });
	}

	/**
	 * Feed the papar
	 */
	public void feed() {
		println();
	}

	/**
	 * Feed the paper
	 * 
	 * @param num
	 *            Tumber of lines to feed
	 */
	public void feed(int num) {
		for (int j = 1; j <= num; j++) {
			println();
		}
	}

	/**
	 * Print a tab.
	 */
	public void tab() {
		write(new byte[] { 9 });
	}

	/**
	 * Set the character spaceing
	 * 
	 * @param spacing
	 *            The spaceing between characters
	 */
	public void setCharSpacing(int spacing) {
		write(new byte[] { 27, 32, 0, 10 });
	}

	/**
	 * Set the line spacing in dots.
	 * 
	 * @param height
	 */
	public void setLineSpacing(int height) {
		write(new byte[] { 27, 51, (byte) ((height << 24) >> 24) });
	}

	/**
	 * Event for reading the respons from the serial connection
	 */
	public synchronized void serialEvent(SerialPortEvent oEvent) {
		if (oEvent.getEventType() == SerialPortEvent.DATA_AVAILABLE) {
			try {
				int available = input.available();
				byte chunk[] = new byte[available];
				input.read(chunk, 0, available);

				// Displayed results are codepage dependent
				System.out.print("SerialEvent = " + new String(chunk));
			} catch (Exception e) {
				System.err.println(e.toString());
			}
		}
		// Ignore all the other eventTypes, but you should consider the other
		// ones.
	}

	/**
	 * This should be called when you stop using the port. This will prevent
	 * port locking on platforms like Linux.
	 */
	public synchronized void close() {
		if (serialPort != null) {
			serialPort.removeEventListener();
			serialPort.close();
		}
		System.out.println("CLOSE THERMAL CONNECTION.");
	}

	public void println() {
		if (serialPort != null) {
			pw.println();
			pw.flush();
		}
	}

	/**
	 * Print a text string
	 * 
	 * @param str
	 *            The string to print
	 */
	public void println(String str) {
		if (serialPort != null) {
			pw.println(str);
			pw.flush();

		}
	}

	/**
	 * Print a byte.
	 * 
	 * @param b
	 *            The byte to print
	 */
	public void write(byte b) {
		if (serialPort != null) {
			try {
				output.write(b);
				output.flush();
			} catch (IOException e) {
				System.out.println("Could not write byte array!");
			}

		}
	}

	/**
	 * Print a byte array. The OutputStream is used instead of the PrintWriter
	 * because it supports byte arrays
	 * 
	 * @param b
	 *            The byte array to print
	 */
	public void write(byte[] b) {
		if (serialPort != null) {
			try {
				output.write(b);
				output.flush();
			} catch (IOException e) {
				System.out.println("Could not write byte array!");
			}

		}
	}

        public void printImageWithEffect(File saveFile) throws Exception {
		BufferedImage bi = ImageIO.read(saveFile);
		int w = bi.getWidth();
		int h = bi.getHeight();
		double ratio = ((double) 128 / w);
		int newWidth = 128;
		int newHeight = (int) (h * ratio);
		//

		// Graphics g = image.getGraphics();
		BufferedImage image = null;
		Graphics2D g = null;
		if (w > h) {
			ratio = ((double) 128 / h);
			newWidth = (int) (w * ratio);
			newHeight = 128;
			image = new BufferedImage(newHeight, newWidth, BufferedImage.TYPE_BYTE_GRAY);
			g = image.createGraphics();
			AffineTransform at = new AffineTransform();

			// rotate 45 degrees around image center
			at.setToTranslation(newHeight, 0);
			at.scale(ratio, ratio);
			at.rotate(90.0 * Math.PI / 180.0, 0, 0);
			g.drawImage(bi, at, null);

		} else {
			image = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_BYTE_GRAY);
			g = image.createGraphics();
			g.drawImage(bi, 0, 0, newWidth, newHeight, null);
		}
		g.dispose();
		BufferedImage effectedImage = new BufferedImage(image.getWidth() * 3, image.getHeight() * 3,
				BufferedImage.TYPE_INT_RGB);

		for (int y = 0; y < image.getHeight(); y++) {
			for (int x = 0; x < image.getWidth(); x++) {
				int clr = image.getRGB(x, y);
				int pixColor = clr & 0x000000ff;

				Boolean[][] colorArray = {};

				if (pixColor > 230) {
					colorArray = totalWhite;
				} else if (pixColor > 205) {
					colorArray = gray10Percent;
				} else if (pixColor > 180) {
					colorArray = gray20Percent;
				} else if (pixColor > 155) {
					colorArray = gray30Percent;
				} else if (pixColor > 130) {
					colorArray = gray40Percent;
				} else if (pixColor > 105) {
					colorArray = gray50Percent;
				} else if (pixColor > 80) {
					colorArray = gray60Percent;
				} else if (pixColor > 55) {
					colorArray = gray70Percent;
				} else if (pixColor > 30) {
					colorArray = gray80Percent;
				} else {
					colorArray = totalBlack;
				}

				int currentRow = 0;
				for (int newY = y * 3; newY < (y * 3) + 3; newY++) {
					int currentColumn = 0;
					for (int newX = x * 3; newX < (x * 3) + 3; newX++) {
						if (colorArray[currentRow][currentColumn]) {
							// Black pixel
							effectedImage.setRGB(newX, newY, blackColor);
						} else {
							// White pixel
							effectedImage.setRGB(newX, newY, whiteColor);
						}
						currentColumn++;
					}
					currentRow++;
				}
			}
		}
		//showImage(effectedImage);
		printImageOnThermal(effectedImage);
		
	}

        public void printImageOnThermal(BufferedImage effectedImage) {
		ArrayList<Byte> bitImage = new ArrayList<Byte>();
		int bitCounter = 0;
		byte tempByte = 0;

		for (int y = 0; y < effectedImage.getHeight(); y++) {
			for (int x = 0; x < effectedImage.getWidth(); x++) {
				int clr = effectedImage.getRGB(x, y);
				int pixColor = clr & 0x000000ff;
				if (pixColor == 0) {
					tempByte += (byte) (1 << bitCounter);
				}
				bitCounter++;
				if (bitCounter == 8) {
					bitCounter = 0;
					bitImage.add(tempByte);
					tempByte = 0;
				}
			}
		}

		byte[] byteArray = new byte[bitImage.size()];
                Byte[] byteObjectArray = bitImage.toArray(new Byte[bitImage.size()]);
                //byte[] byteArray = bitImage.toArray(new byte[bitImage.size()]);
                //System.out.println("byteArray="+byteArray.toString());
		for (int i = 0; i < bitImage.size(); i++) {
			byteArray[i] = (byte) byteObjectArray[i];
		}

		printBitmap(effectedImage.getWidth(), effectedImage.getHeight(), byteArray);
		feed(4);

		System.out.println("Image printed.");
	}
}


