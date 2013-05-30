package com.SHRF.ap1;

import android.app.Activity;
import android.widget.TextView;
import android.os.Bundle;
import android.util.Log;


/**
 * A minimal "Hello, World!" application.
 */
public class hellow extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
		Log.d("yytAg", "hello, world, w!");

		TextView tv = new TextView(this);
		tv.setText("Hello, Android");
		setContentView(tv);
        //setContentView(R.layout.hello_activity);
    }
}

