package com.TCL;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;

import android.os.Binder;
import android.os.Parcel;
//import android.os.RemoteException;
import android.widget.TextView;


import android.content.Context;
import android.location.LocationManager;
import android.app.ActivityThread;

import android.os.ServiceManager;

public class xap1 extends Activity
{
	public static final String TCL_SERVICE = "TCL.portal";
	Binder tcl_binder;

	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);


		TextView outxt = (TextView)findViewById(R.id.yydisp);
		outxt.append("\n===============================\n");


		ActivityThread thread = ActivityThread.systemMain();
	        Context context = thread.getApplication();
        	tcl_binder = (Binder) context.getSystemService(TCL_SERVICE);

		
		if(tcl_binder != null)
			outxt.append("Get YYJSVC ok");
		else
			outxt.append("Get a null BINDER");

	}
/*
	public native int FromJni();
	static {
		System.loadLibrary("TCLPT");
	}*/
}
