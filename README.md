apktool
=======

一.反编译Apk得到Java源代码 
转载自：http://hi.baidu.com/%CB%BF%D4%B5%CC%EC%CF%C2/blog/item/2284e2debafc541e495403ec.html
 
工具下载：需用到dex2jar和JD-GUI这2个工具
dex2jar下载地址：http://laichao.googlecode.com/files/dex2jar-0.0.7-SNAPSHOT.zip
JD-GUI下载地址：
  windows版JD-GUI：http://laichao.googlecode.com/files/jdgui.zip
  Linux版JD-GUI：http://laichao.googlecode.com/files/jd-gui-0.3.2.linux.i686.tar.gz
步骤：
1.首先找到Android软件安装包中的classes.dex
把.apk文件改名为.zip，然后解压缩,得到其中的classes.dex文件，它就是java文件编译再通过dx工具打包成的,所以现在我们就用上述提到的2个工具来逆方向导出java源文件

2.把classes.dex拷贝到dex2jar.bat所在目录。
在命令行模式下定位到dex2jar.bat所在目录，运行 dex2jar.bat classes.dex  ，生成classes.dex.dex2jar.jar 

3.运行JD-GUI工具（它是绿色无须安装的）
打开上面的jar文件，即可看到源代码

---------------------------------------------------------------------------------
反编译apk生成程序的源代码和图片、XML配置、语言资源等文件。

APKTool是GOOGLE提供的APK编译工具，需要JAVA运行环境，推荐使用JDK1.6或者JDK1.7。
如果你想对APK文件进行修改，那么就不可避免的要使用到APKTool。论坛里有很多关于ROM美化的帖子都需要自己动手修改APK文件，比如修改framework-res.apk、systemUI.apk等等。
相信各位有不少人看了后都想亲自来修改一番，但是结果却是遇到了各式各样的错误却无法进行改正，甚至都不知道自己错在哪里。

一．APKTOOL使用环境配置
1.安装JAVA并设置环境变量。
下载安装都很简单，关键是安装完后还需要亲自设置环境变量以方便其他程序能够条用JAVA。
以WIN7为例，在桌面上右键点击计算机——>属性——>高级系统设置——>环境变量——>在下边的系统变量里新建一个变量，变量名为JAVA_HOME，值为JAVA的安装路径，比如我的是H:\ProgramFiles\Java\jdk1.6.0_26

二．APKTool的安装
1.其实这个谈不上安装，不过如果你愿意的话可以把下载到的APKTOOL中的三个文件（aapt.exe、apktool.bat、apktool.jar）解压缩到你的Windows安装目录下，以方便使用Dos命令.
2.可能有些人下载的APKTOOL里有个安装的bat文件，并且有另外两个方便使用的bat文件，在这里我不推荐大家使用这些bat文件，虽然使用起来很方便（其实我并不觉得方便），但是如果出现错误不方便查看。

三．APKTool的使用
1.decode
该命令用于进行反编译apk文件，一般用法为
apktool d <file.apk> <dir>
<file.apk>代表了要反编译的apk文件的路径，最好写绝对路径，比如C:\MusicPlayer.apk
<dir>代表了反编译后的文件的存储位置，比如C:\MusicPlayer
如果你给定的<dir>已经存在，那么输入完该命令后会提示你，并且无法执行，需要你重新修改命令加入-f指令
apktool d –f <file.apk> <dir>
这样就会强行覆盖已经存在的文件

2.build
该命令用于编译修改好的文件，一般用法为
apktool b <dir>
这里的<dir>就是刚才你反编译时输入的<dir>（如C:\MusicPlayer）,输入这行命令后，如果一切正常，你会发现C:\MusicPlayer内多了2个文件夹build和dist，其中分别存储着编译过程中逐个编译的文件以及最终打包的apk文件。

3.install-framework
该命令用于为APKTool安装特定的framework-res.apk文件，以方便进行反编译一些与ROM相互依赖的APK文件。

4.单独反编译AndroidMenifest.xml
java -jar AXMLPrinter2.jar  AndroidManifest.xml  > newxml.xml

5.使用AXMLPrinter2.jar批量反编译xml文件. 假如要反编译layout目录下的所有xml文件, 
需要将AXMLPrinter2.jar和layout在同一个目录下, 然后编写bat脚本: 
 for /r layout %a in (*.xml) do @java -jar AXMLPrinter2.jar "%a">>"%a".xml . 执行完就OK了. 
