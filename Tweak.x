%hook CCVPNModule
- (id)init{
    id ret = %orig;
    [[NSNotificationCenter defaultCenter] addObserver:ret selector:@selector(refreshState) name:@"VPNConnectionStatusChanged" object:nil];
    return ret;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
%end //CCVPNModule

%ctor{
    NSLog(@"ctor: CCVPNNoUpdateDelay");
    if(![[NSBundle bundleWithPath:@"/Library/ControlCenter/Bundles/CCVPN.bundle"] load]){
        [[NSBundle bundleWithPath:@"/var/jb/Library/ControlCenter/Bundles/CCVPN.bundle"] load];
    }
}