
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;

// code based on a post by PhiLho 
void Clipboard_copy(String data) {
    Clipboard clipboard = getToolkit().getSystemClipboard();
    clipboard.setContents(new StringSelection(data), null);
}

String Clipboard_paste()
{
  Clipboard clipboard = getToolkit().getSystemClipboard();
  Transferable contents = clipboard.getContents(null);
  if (contents != null && contents.isDataFlavorSupported(DataFlavor.stringFlavor)) {
    try {
	return (String)contents.getTransferData(DataFlavor.stringFlavor);
    } catch (UnsupportedFlavorException exu) { return ""; }
      catch (java.io.IOException exi) { return ""; }
  }
  else return "";
} 

