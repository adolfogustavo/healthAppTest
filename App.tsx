import React from 'react';
import {
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  StatusBar,
} from 'react-native';
import HealthkitController from './Healthkit.js';

export default function App() {
  return (
    <View style={styles.container}>
      <StatusBar barStyle="default" />
      <TouchableOpacity
        onPress={() => HealthkitController.requestAuthorization()}>
        <Text>Request Healthkit Permissions</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
