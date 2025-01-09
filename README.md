# Reality Composer Pro ReflectionDiffuse color issue showcase 
this is an isolated project to demonstrate the issue within where ReflectionDiffuse does not show any color information of the video, but only whites, as you can see in the screenshot below
<img width="665" alt="Screenshot 2025-01-08 at 11 00 01 PM" src="https://github.com/user-attachments/assets/f2df9565-7c7f-4282-bafb-1c86bfbcfaf1" />

## Workflow in Reality Composer Pro before running python script
1. Imported backroomsBlenderExport.usdc from blender export and baked textures
2. Changed axis to y to be up
3. Added video dock, and deleted “ground” and ground.usda
4. Moved VideoDock, x -200cm, y 130cm, z-640cm
5. Changed the width of player to 540
Material has not been altered, and baked textures were not applied to objects. nor ReflectionDiffuse or ReflectionSpecula were added.

## Python Script 
`python3 computeDiffuseReflectionUVs.py backroomsBlenderExport.usdc -o backroomsDiffuseComputed.usdc -p "/backrooms3Root" -r true -x -2 -y 1.3 -z -6.4 -w 5.4 -s 2000 --emitterUVExponent 12`

this produced `backroomsDiffuseComputed.usdc` in the same folder. 
result of running the script is as follows:
```shell
Finished computing diffuse reflection UVs. Please use the following options in Reality Composer Pro:
- emitter UV name = "primvar:emissionUV"
- attenuation UV name = "primvar:attenuationUV"
- docking region X = -2.0 m
- docking region Y = 1.3 m
- docking region Z = -6.4 m
- docking region width = 5.4 m
- no custom attenuation UV measurements provided, therefore please ensure you use the default attenuation texture provided by Reality Composer Pro
```

## Workflow for backroomsDiffuseComputed.usdc
1. opened backroomsDiffuseComputed.usdc in Reality Composer Pro
2. added nodes to carpet materials to  <img width="1179" alt="Screenshot 2025-01-08 at 11 11 25 PM" src="https://github.com/user-attachments/assets/c1c429ea-b0de-4d9c-8ae3-3cc6c85daae2" />
3. follwed similar workflow for other objects. Other objects do not have `ReflectionSpecular` node added. As i only want to show diffusion on wall / ceiling.
