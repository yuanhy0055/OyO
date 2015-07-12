package sy.a;

import android.app.Activity;
import android.os.Bundle;
import android.view.WindowManager;
import android.graphics.Color;
import android.widget.TextView;

public class Y0 extends Activity
{
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);

		WindowManager.LayoutParams attrs = getWindow().getAttributes();
		attrs.flags |= WindowManager.LayoutParams.FLAG_FULLSCREEN
				| WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON
				| WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON
				| WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD;
		getWindow().setAttributes(attrs);
		
        setContentView(R.layout.main);

		TextView tv1 = (TextView) findViewById(R.id.yymsg);
		tv1.setTextColor(Color.YELLOW);
		tv1.append("\n"+android.os.Build.VERSION.RELEASE + " " + android.os.Build.CPU_ABI);
		tv1.append("\n"+android.os.Build.ID + " " + android.os.Build.TYPE);
		tv1.append("\n"+android.os.Build.USER + "@" + android.os.Build.HOST);
		tv1.append("\n"+android.os.Build.MANUFACTURER + " "+ android.os.Build.DEVICE);
		tv1.append("\n"+android.os.Build.DISPLAY);
    }
}
